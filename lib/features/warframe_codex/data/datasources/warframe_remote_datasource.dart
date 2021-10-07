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

  /// Refresh warframes data in the app to get updated warframes if there
  /// happens to be any new warframe.
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
    /// If no connection is detected, the method should not continue.
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

  /// Should return whether the method has ran out of re-try count or not.
  ///
  /// Everytime [getRemoteWarframes] re-runs, [_retryCount] increments, if
  /// [_retryCount] happens to be equal to or, exceed [_thresholdLimit] the
  /// method call should exit to avoid infinity loops.
  bool _timedOut() {
    return _retryCount >= _thresholdLimit;
  }

  /// Call when [getRemoteWarframes] is unsuccessful and [WarframeState] needs
  /// or has to be set to an empty state before exiting.
  void _setStateAsEmpty() {
    state = WarframeState.empty;
    notifyListeners();
  }

  /// Call when [getRemoteWarframes] is running and [WarframeState] needs or has
  /// to be set to a loading state.
  void _setStateAsLoading() {
    state = WarframeState.loading;
    notifyListeners();
  }

  /// Call when [getRemoteWarframes] is successfully and [WarframeState] needs
  /// or has to be set to loaded state before exiting.
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

  /// If the [data] list is not be empty, new items from [newsList] should be
  /// added to [data] if there happens to be no item with the same id.
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
