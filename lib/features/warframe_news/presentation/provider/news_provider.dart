import 'package:dartz/dartz.dart';
import 'package:warframe/core/error/exceptions.dart';
import 'package:warframe/core/usecases/usecases.dart';
import 'package:warframe/features/warframe_news/data/models/news.dart';
import 'package:warframe/features/warframe_news/domain/usecases/get_news.dart';
import 'package:warframe/features/warframe_news/domain/usecases/refresh_news.dart';

class NewsProvider {
  const NewsProvider(
    this._getNews,
    this._refreshNews,
  );
  final GetNews _getNews;
  final RefreshNews _refreshNews;

  Future<List<NewsModel>?> getNews() async {
    return _getNews.call(NoParams()).then(
      (Either<WarframeException, List<NewsModel>?> value) {
        return value.getOrElse(() => <NewsModel>[]);
      },
    );
  }

  Future<void> refreshNews() async {
    return _refreshNews.call(NoParams()).then(
      (Either<WarframeException, void> value) {
        return;
      },
    );
  }
}
