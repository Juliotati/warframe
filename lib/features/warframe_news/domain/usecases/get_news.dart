import 'package:dartz/dartz.dart';
import 'package:warframe/core/error/exceptions.dart';

import 'package:warframe/core/usecases/usecases.dart';
import 'package:warframe/features/warframe_news/data/models/news.dart';
import 'package:warframe/features/warframe_news/domain/repositories/news_repository.dart';

class GetNews implements UseCase<void, NoParams> {
  const GetNews(this._repository);

  final NewsRepository _repository;

  @override
  Future<Either<WarframeException, List<NewsModel>?>> call(_) async {
    return _repository.getNews();
  }
}
