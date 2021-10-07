import 'package:dartz/dartz.dart';
import 'package:warframe/core/error/failures.dart';
import 'package:warframe/core/usecases/usecases.dart';
import 'package:warframe/features/warframe_news/domain/repositories/news_repository.dart';

class RefreshNews implements UseCase<void, NoParams> {
  const RefreshNews(this.repository);

  final NewsRepository repository;

  @override
  Future<Either<Failure, void>> call(NoParams params) {
    return repository.refreshNews();
  }
}
