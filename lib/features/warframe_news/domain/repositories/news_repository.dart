import 'package:dartz/dartz.dart';
import 'package:warframe/core/error/exceptions.dart';
import 'package:warframe/features/warframe_news/data/models/news_model.dart';

abstract class NewsRepository {
  Future<Either<WarframeException, List<NewsModel>?>> getNews();
}
