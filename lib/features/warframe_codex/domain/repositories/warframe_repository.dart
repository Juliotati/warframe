import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/warframe.dart';

abstract class WarframeRepository {
  Future<Either<Failure, List<Warframe>>> getWarframes();
  Future<Either<Failure, Warframe>> getWarframe(String name);
}
