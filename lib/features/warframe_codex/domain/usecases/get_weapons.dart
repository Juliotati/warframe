import 'package:dartz/dartz.dart';
import 'package:warframe/features/warframe_codex/domain/entities/weapon.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecases.dart';
import '../repositories/weapon_repository.dart';

class GetWeapons implements UseCase<List<Weapon>, NoParams> {
  const GetWeapons(this.repository);

  final WeaponsRepository repository;

  @override
  Future<Either<Failure, List<Weapon>>> call(NoParams params) async {
    return repository.getWeapons();
  }
}
