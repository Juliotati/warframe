import 'package:http/http.dart' as http;
import 'package:warframe/core/helpers/datasource_helper.dart';
import 'package:warframe/core/keys/apis.dart';
import 'package:warframe/features/warframe_news/data/models/news_model.dart';

abstract class NewsRemoteDatasource {
  /// Get the latest news from the API about the warframe game or community.
  Future<List<NewsModel>?> news();
}

class NewsRemoteDatasourceImpl extends NewsRemoteDatasource {
  static int _retryCount = 0;
  static const int _thresholdLimit = 5;

  @override
  Future<List<NewsModel>?> news() async {
    final http.Response response = await DatasourceHelper.get(API.newsAPI);

    if (response.statusCode != 200) return null;

    /// Decode the response body with the help of DatasourceHelper class.
    final List<dynamic> _decodedData = await DatasourceHelper.decode(
      response.body,
    );

    /// If `_decodedData` is empty, `news` should enter a recursive session.
    ///
    /// If the there happens to be many tries after re-running, the recursion
    /// should exit to avoid an infinity loop.
    if (_decodedData.isEmpty) {
      if (_timedOut) return null;

      _retryCount++;
      return news();
    }

    return _newsList(_decodedData);
  }

  /// Should return whether the method has ran out of re-try count or not.
  ///
  /// Everytime [news] re-runs, [_retryCount] increments, if
  /// [_retryCount] happens to be equal to or, exceed [_thresholdLimit] the
  /// method call should exit to avoid infinity loops.
  bool get _timedOut {
    return _retryCount >= _thresholdLimit;
  }

  /// Transform the decoded data into dart objects as [NewsModel].
  Future<List<NewsModel>> _newsList(List<dynamic> data) async {
    return data.map((dynamic news) {
      return NewsModel.fromJson(news as Map<String, dynamic>);
    }).toList();
  }
}
