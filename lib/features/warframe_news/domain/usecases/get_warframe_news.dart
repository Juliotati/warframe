import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecases.dart';
import '../repositories/warframe_news_repository.dart';

class GetWarframeNews implements UseCase<void, NoParams> {
  const GetWarframeNews(this.repository);

  final WarframeNewsRepository repository;

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return repository.getWarframeNews();
  }
}
