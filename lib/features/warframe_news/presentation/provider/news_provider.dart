import 'package:flutter/cupertino.dart';
import 'package:warframe/core/platform/network_info.dart';
import 'package:warframe/core/presentation/widgets/snack_bar.dart';
import 'package:warframe/features/warframe_news/data/datasources/news_remote_datasource.dart';
import 'package:warframe/features/warframe_news/data/models/news.dart';

enum NewsState {
  loaded,
  loading,
  empty,
}

class NewsProvider with ChangeNotifier {
  NewsProvider(this._remoteDataSource);

  final NewsRemoteDatasourceImpl _remoteDataSource;

  List<NewsModel>? _data;

  List<NewsModel>? get data => _data;

  NewsState state = NewsState.empty;

  Future<void> getNews(BuildContext context) async {
    _setStateAsLoading();

    /// Get connection state from NetWorkInfoImpl class
    final bool isConnected = await NetWorkInfoImpl.instance.isConnected;

    Future<void> showOfflineWarning() {
      return warframeErrorSnackBar(context, 'No internet connection found.');
    }

    /// If no connection is detected, the method should not continue.
    if (!isConnected) {
      _setStateAsEmpty();

      /// TODO: load data from local data source
      showOfflineWarning();
      return;
    }

    try {
      final List<NewsModel>? _news = await _remoteDataSource.getRemoteNews();
      if (_news != null) {
        _data = _news;
        _setStateAsLoaded();
        return;
      }
      _setStateAsEmpty();
    } catch (_) {
      _setStateAsEmpty();
      rethrow;
    }
  }

  Future<void> refreshNews(BuildContext context) async {
    await getNews(context);
  }

  /// Call when [getNews] is unsuccessful and [NewsState] needs or
  /// has to be set to an empty state before exiting.
  void _setStateAsEmpty() {
    state = NewsState.empty;
    notifyListeners();
  }

  /// Call when [getNews] is running and [NewsState] needs or has
  /// to be set to a loading state.
  void _setStateAsLoading() {
    state = NewsState.loading;
    notifyListeners();
  }

  /// Call when [getNews] is successfully and [NewsState] needs
  /// or has to be set to loaded state before exiting.
  void _setStateAsLoaded() {
    state = NewsState.loaded;
    notifyListeners();
  }
}
