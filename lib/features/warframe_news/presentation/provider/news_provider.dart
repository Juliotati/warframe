import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:warframe/core/config/providers/providers.dart';
import 'package:warframe/core/error/exceptions.dart';
import 'package:warframe/core/usecases/usecases.dart';
import 'package:warframe/features/warframe_news/data/models/news_model.dart';
import 'package:warframe/features/warframe_news/domain/usecases/get_news.dart';

class NewsProvider with ChangeNotifier {
  NewsProvider(this._getNews);

  final GetNews _getNews;

  ProviderState state = ProviderState.idle;

  List<NewsModel>? _news = <NewsModel>[];

  List<NewsModel>? get news => _news;

  Future<void> getNews() async {
    _setStateAsLoading();
    await _getNews.call(NoParams()).then(_updateNews);
  }

  void _updateNews(Either<WarframeException, List<NewsModel>?> result) {
    if (result.isLeft()) {
      _setStateAsHasError();
      return;
    }
    if (result.isRight() && result.getOrElse(() => null) == null) {
      _setStateAsEmpty();
      return;
    }

    _news = result.getOrElse(() => <NewsModel>[]);
    _setStateAsLoaded();
  }

  Future<void> refreshNews() async {
    return getNews();
  }

  void _setStateAsLoading() {
    state = ProviderState.loading;
    notifyListeners();
  }

  void _setStateAsHasError() {
    state = ProviderState.hasError;
    notifyListeners();
  }

  void _setStateAsEmpty() {
    state = ProviderState.empty;
    notifyListeners();
  }

  void _setStateAsLoaded() {
    state = ProviderState.loaded;
    notifyListeners();
  }
}
