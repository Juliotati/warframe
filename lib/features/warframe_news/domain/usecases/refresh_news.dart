import 'package:dartz/dartz.dart';
import 'package:warframe/core/error/exceptions.dart';
import 'package:warframe/core/usecases/usecases.dart';
import 'package:warframe/features/warframe_news/domain/repositories/news_repository.dart';

class RefreshNews implements UseCase<void, NoParams> {
  const RefreshNews(this._repository);

  final NewsRepository _repository;

  @override
  Future<Either<WarframeException, void>> call(_) async {
    return _repository.refreshNews();
  }
}
