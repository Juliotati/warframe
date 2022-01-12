import 'package:dartz/dartz.dart';
import 'package:warframe/core/error/exceptions.dart';
import 'package:warframe/core/usecases/usecases.dart';
import 'package:warframe/features/warframe_codex/domain/entities/weapon.dart';

import 'package:warframe/features/warframe_codex/domain/repositories/warframe_repository.dart';

class GetWeapons implements UseCase<List<Weapon>, NoParams> {
  const GetWeapons(this._repository);

  final WarframeRepository _repository;

  @override
  Future<Either<WarframeException, List<Weapon>>> call(_) async {
    return _repository.getWeapons();
  }
}
