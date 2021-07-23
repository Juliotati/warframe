import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecases.dart';
import '../entities/warframe_news.dart';
import '../repositories/warframe_news_repository.dart';

class GetWarframeNews implements UseCase<List<WarframeNews>, NoParams> {
  const GetWarframeNews(this.repository);

  final WarframeNewsRepository repository;

  @override
  Future<Either<Failure, List<WarframeNews>>> call(NoParams params) async {
    return repository.getWarframeNews();
  }
}
