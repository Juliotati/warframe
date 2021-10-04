import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:warframe/core/helpers/datasource_helper.dart';
import 'package:warframe/core/keys/apis.dart';
import 'package:warframe/core/platform/network_info.dart';

import '../models/warframe_news.dart';

abstract class NewsRemoteDatasource {

  /// Get the latest news from the API about the warframe game or community.
  Future<void> getRemoteWarframeNews();

  /// Refresh news data in the app to get updated news if there happens to be.
  Future<void> refresh();
}

enum NewsState {
  loaded,
  loading,
  empty,
}

class NewsRemoteDatasourceImpl extends NewsRemoteDatasource with ChangeNotifier {
  List<WarframeNewsModel>? data;

  NewsState state = NewsState.empty;

  static int _retryCount = 0;
  static const int _thresholdLimit = 5;

  @override
  Future<void> getRemoteWarframeNews() async {
    _setStateAsLoading();

    /// Get connection state form NetWorkInfoImpl class
    final bool isConnected = await NetWorkInfoImpl.instance.isConnected;

    /// Check whether the device has connection or not.
    /// If no connection is detected, the method is existed.
    if (!isConnected) {
      _setStateAsEmpty();
      return;
    }

    final http.Response response = await DatasourceHelper.get(API.newsAPI);

    if (response.statusCode != 200) {
      _setStateAsEmpty();
      return;
    }

    /// Decode the response body from the HTTP GET
    final List<dynamic> _decodedData = await DatasourceHelper.decodeData(response.body);

    /// If _decodedData list comes in empty, the method whole method should
    /// re-run.
    ///
    /// If the there happens to be many tries after re-running the method whole
    /// will exits too.
    if (_decodedData.isEmpty) {
      if (_timedOut()) {
        _setStateAsEmpty();
        return;
      }

      state = NewsState.loading;
      _retryCount++;
      getRemoteWarframeNews();
      return;
    }

    List<WarframeNewsModel>? _news = await _newsList(_decodedData);

    if (data == null) {
      data = _news;
      _setStateAsLoaded();
      return;
    }

    if (data!.isNotEmpty) {
      await _addNewData(_news);
      _news = null;
    }

    _setStateAsLoaded();
  }

  /// Should return whether the method has ran out of tries count or not
  ///
  /// Everytime [getRemoteWarframeNews] re-runs, [_retryCount] increments, if
  /// [_retryCount] happens to be equal to or, exceed [_thresholdLimit] the
  /// method call should exit to avoid infinity loops
  bool _timedOut() {
    return _retryCount >= _thresholdLimit;
  }

  /// Called when [getRemoteWarframeNews] is exiting which, was unsuccessful and
  /// [NewsState] needs/has to be set to empty state
  void _setStateAsEmpty() {
    state = NewsState.empty;
    notifyListeners();
  }

  /// Called when [getRemoteWarframeNews] is running and [NewsState] needs/has
  /// to be set to loaded state
  void _setStateAsLoading() {
    state = NewsState.loading;
    notifyListeners();
  }

  /// Called when [getRemoteWarframeNews] is exiting which, was successful and
  /// [NewsState] needs/has to be set to loaded state
  void _setStateAsLoaded() {
    state = NewsState.loaded;
    notifyListeners();
  }

  /// Transform the decoded data into dart objects as [WarframeNewsModel]
  Future<List<WarframeNewsModel>> _newsList(List<dynamic> data) async {
    return data
        .map((dynamic news) {
          return WarframeNewsModel.fromJson(news as Map<String, dynamic>);
        })
        .toList()
        .reversed
        .toList();
  }

  Future<void> _addNewData(List<WarframeNewsModel> newsList) async {
    for (final WarframeNewsModel _item in newsList) {
      if (!DatasourceHelper.idExists(data!, _item)) {
        data!.insert(0, _item);
      }
    }
  }

  @override
  Future<void> refresh() async {
    _retryCount = 0;
    await getRemoteWarframeNews();
  }
}
