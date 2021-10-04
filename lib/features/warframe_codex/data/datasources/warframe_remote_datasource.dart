import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:warframe/core/helpers/datasource_helper.dart';
import 'package:warframe/core/keys/apis.dart';
import 'package:warframe/core/platform/network_info.dart';
import 'package:warframe/features/warframe_codex/data/models/warframe_model.dart';

abstract class WarframeRemoteDatasource {
  /// Gets the data about the warframe provided as a parameter from the local
  /// list of warframes previously populated.
  WarframeModel getWarframe(String warframeName);

  /// Gets all Prime and non-prime warframes from the official warframe API
  Future<void> getRemoteWarframes();

  /// Refresh news data in the app to get updated news if there happens to be.
  Future<void> refresh();
}

enum WarframeState {
  loaded,
  loading,
  empty,
}

class WarframeRemoteDatasourceImpl extends WarframeRemoteDatasource with ChangeNotifier {
  List<WarframeModel>? data;

  WarframeState state = WarframeState.empty;

  static int _retryCount = 0;
  static const int _thresholdLimit = 5;

  @override
  WarframeModel getWarframe(String warframeName) {
    return data!.firstWhere((WarframeModel warframe) {
      return warframe.name == warframeName;
    });
  }

  @override
  Future<void> getRemoteWarframes() async {
    _setStateAsLoading();

    /// Get connection state form NetWorkInfoImpl class
    final bool isConnected = await NetWorkInfoImpl.instance.isConnected;

    /// Check whether the device has connection or not.
    /// If no connection is detected, the method is existed.
    if (!isConnected) {
      _setStateAsEmpty();
      return;
    }

    try {
      final http.Response response = await DatasourceHelper.get(API.warframeAPI);

      if (response.statusCode != 200) {
        _setStateAsEmpty();
        return;
      }

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

        state = WarframeState.loading;
        _retryCount++;
        getRemoteWarframes();
        return;
      }

      List<WarframeModel>? _warframes = await _warframeList(_decodedData);

      if (data == null) {
        data = _warframes;
        _setStateAsLoaded();
        return;
      }

      if (data!.isNotEmpty) {
        await _addNewData(_warframes);
        _warframes = null;
      }

      _setStateAsLoaded();
    } catch (_) {
      rethrow;
    }
  }

  /// Should return whether the method has ran out of tries count or not
  ///
  /// Everytime [getRemoteWarframes] re-runs, [_retryCount] increments, if
  /// [_retryCount] happens to be equal to or, exceed [_thresholdLimit] the
  /// method call should exit to avoid infinity loops
  bool _timedOut() {
    return _retryCount >= _thresholdLimit;
  }

  /// Called when [getRemoteWarframes] is exiting which, was unsuccessful and
  /// [WarframeState] needs/has to be set to empty state
  void _setStateAsEmpty() {
    state = WarframeState.empty;
    notifyListeners();
  }

  /// Called when [getRemoteWarframeNews] is running and [NewsState] needs/has
  /// to be set to loaded state
  void _setStateAsLoading() {
    state = WarframeState.loading;
    notifyListeners();
  }

  /// Called when [getRemoteWarframeNews] is exiting which, was successful and
  /// [NewsState] needs/has to be set to loaded state
  void _setStateAsLoaded() {
    state = WarframeState.loaded;
    notifyListeners();
  }

  /// Transform the decoded data into dart objects as [WarframeModel]
  Future<List<WarframeModel>> _warframeList(List<dynamic> data) async {
    return data.map((dynamic warframe) {
      return WarframeModel.fromJson(warframe as Map<String, dynamic>);
    }).toList();
  }

  Future<void> _addNewData(List<WarframeModel> warframeList) async {
    for (final WarframeModel warframe in warframeList) {
      if (!DatasourceHelper.uniqueNameExists(data!, warframe)) {
        data!.insert(0, warframe);
      }
    }
  }

  @override
  Future<void> refresh() async {
    _retryCount = 0;
    await getRemoteWarframes();
  }
}
