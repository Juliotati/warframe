import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/weapon.dart';

abstract class WeaponsRepository {
  Future<Either<Failure, List<Weapon>>> getWeapons();
}
