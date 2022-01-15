import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:warframe/core/error/exceptions.dart';
import 'package:warframe/core/usecases/usecases.dart';
import 'package:warframe/features/warframe_news/data/models/news_model.dart';
import 'package:warframe/features/warframe_news/domain/usecases/get_news.dart';

enum NewsProviderState {
  idle,
  loaded,
  loading,
}

class NewsProvider with ChangeNotifier {
  NewsProvider(this._getNews);

  final GetNews _getNews;

  NewsProviderState state = NewsProviderState.idle;
  bool hasData = false;
  bool hasError = false;

  List<NewsModel>? _news = <NewsModel>[];

  List<NewsModel>? get news => _news;

  Future<void> getNews() async {
    _setStateAsLoading();
    _news = await _getNews.call(NoParams()).then(
      (Either<WarframeException, List<NewsModel>?> result) {
        if (result.isLeft()) {
          hasData = true;
          hasError = true;
          return _news;
        }
        return result.getOrElse(() => <NewsModel>[]);
      },
    );
    if (_news != null || _news!.isNotEmpty) hasData = true;
    _setStateAsLoaded();
  }

  Future<void> refreshNews() async {
    getNews();
  }

  void _setStateAsLoading() {
    hasData = false;
    hasError = false;
    state = NewsProviderState.loading;
    notifyListeners();
  }

  void _setStateAsLoaded() {
    state = NewsProviderState.loaded;
    notifyListeners();
  }
}
