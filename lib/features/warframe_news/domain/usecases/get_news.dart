import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecases.dart';
import '../repositories/news_repository.dart';

class GetNews implements UseCase<void, NoParams> {
  const GetNews(this.repository);

  final NewsRepository repository;

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return repository.getWarframeNews();
  }
}
