import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

abstract class WarframeNewsRepository {
  Future<Either<Failure, void>> getWarframeNews();
}
