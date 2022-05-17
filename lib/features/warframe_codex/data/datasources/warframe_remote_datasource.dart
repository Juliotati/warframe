import 'package:http/http.dart' as http;
import 'package:warframe/core/helpers/datasource_helper.dart';
import 'package:warframe/core/keys/apis.dart';
import 'package:warframe/features/warframe_codex/data/models/warframe_model.dart';

abstract class WarframeRemoteDatasource {
  /// Gets all Prime and non-prime warframes
  Future<void> warframes();
}

class WarframeRemoteDatasourceImpl extends WarframeRemoteDatasource {
  static int _retryCount = 0;
  static const int _thresholdLimit = 5;

  @override
  Future<List<WarframeModel>?> warframes() async {
    final http.Response response = await DatasourceHelper.get(
      API.warframeAPI,
    );

    if (response.statusCode != 200) return null;

    /// Decode the response body with the help of DatasourceHelper class.
    final List<dynamic> _decodedData = await DatasourceHelper.decode(
      response.body,
    );

    /// If _decodedData comes in empty, the whole method should re-run.
    ///
    /// If the there happens to be many tries after re-running, the method
    /// should exit to avoid an infinity loop.
    if (_decodedData.isEmpty) {
      if (_timedOut) return null;

      _retryCount++;
      return warframes();
    }

    return _warframeList(_decodedData);
  }

  /// Should return whether the method has ran out of re-try count or not.
  ///
  /// Everytime [warframes] re-runs, [_retryCount] increments, if
  /// [_retryCount] happens to be equal to or, exceed [_thresholdLimit] the
  /// method call should exit to avoid infinity loops.
  bool get _timedOut {
    return _retryCount >= _thresholdLimit;
  }

  /// Transform the decoded data into dart objects as [WarframeModel]
  Future<List<WarframeModel>> _warframeList(List<dynamic> data) async {
    return data.map((dynamic warframe) {
      return WarframeModel.fromJson(warframe as Map<String, dynamic>);
    }).toList();
  }
}
