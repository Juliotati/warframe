import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:warframe/core/helpers/datasource_helper.dart';
import 'package:warframe/core/keys/apis.dart';
import 'package:warframe/core/platform/network_info.dart';

import '../models/news.dart';

abstract class NewsRemoteDatasource {

  /// Get the latest news from the API about the warframe game or community.
  Future<void> getRemoteNews();

  /// Refresh news data in the app to get updated news if there happens to be
  /// any fresh ones available.
  Future<void> refreshNews();
}

enum NewsState {
  loaded,
  loading,
  empty,
}

class NewsRemoteDatasourceImpl extends NewsRemoteDatasource with ChangeNotifier {
  List<NewsModel>? data;

  NewsState state = NewsState.empty;

  static int _retryCount = 0;
  static const int _thresholdLimit = 5;

  @override
  Future<void> getRemoteNews() async {
    _setStateAsLoading();

    /// Get connection state from NetWorkInfoImpl class
    final bool isConnected = await NetWorkInfoImpl.instance.isConnected;

    /// Check whether the device has connection or not.
    /// If no connection is detected, the method should not continue.
    if (!isConnected) {
      _setStateAsEmpty();
      return;
    }

    final http.Response response = await DatasourceHelper.get(API.newsAPI);

    if (response.statusCode != 200) {
      _setStateAsEmpty();
      return;
    }

    /// Decode the response body with the help of DatasourceHelper class.
    final List<dynamic> _decodedData = await DatasourceHelper.decode(response.body);

    /// If _decodedData comes in empty, the whole method should re-run.
    ///
    /// If the there happens to be many tries after re-running, the method
    /// should exit to avoid an infinity loop.
    if (_decodedData.isEmpty) {
      if (_timedOut()) {
        _setStateAsEmpty();
        return;
      }

      state = NewsState.loading;
      _retryCount++;
      getRemoteNews();
      return;
    }

    List<NewsModel>? _news = await _newsList(_decodedData);

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

  /// Should return whether the method has ran out of re-try count or not.
  ///
  /// Everytime [getRemoteNews] re-runs, [_retryCount] increments, if
  /// [_retryCount] happens to be equal to or, exceed [_thresholdLimit] the
  /// method call should exit to avoid infinity loops.
  bool _timedOut() {
    return _retryCount >= _thresholdLimit;
  }

  /// Call when [getRemoteNews] is unsuccessful and [NewsState] needs or
  /// has to be set to an empty state before exiting.
  void _setStateAsEmpty() {
    state = NewsState.empty;
    notifyListeners();
  }

  /// Call when [getRemoteNews] is running and [NewsState] needs or has
  /// to be set to a loading state.
  void _setStateAsLoading() {
    state = NewsState.loading;
    notifyListeners();
  }

  /// Call when [getRemoteNews] is successfully and [NewsState] needs
  /// or has to be set to loaded state before exiting.
  void _setStateAsLoaded() {
    state = NewsState.loaded;
    notifyListeners();
  }

  /// Transform the decoded data into dart objects as [NewsModel].
  Future<List<NewsModel>> _newsList(List<dynamic> data) async {
    return data.map((dynamic news) {
      return NewsModel.fromJson(news as Map<String, dynamic>);
    }).toList();
  }

  /// If the [data] list is not empty, new items from [newsList] should be
  /// added to [data] if there's no item with the same id.
  Future<void> _addNewData(List<NewsModel> newsList) async {
    for (final NewsModel _item in newsList) {
      if (!DatasourceHelper.idExists(data!, _item)) {
        data!.insert(0, _item);
      }
    }
  }

  @override
  Future<void> refreshNews() async {
    _retryCount = 0;
    await getRemoteNews();
  }
}
