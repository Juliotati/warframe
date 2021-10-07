import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

abstract class NewsRepository {
  Future<Either<Failure, void>> getNews();
  Future<Either<Failure, void>> refreshNews();
}
