import 'package:dartz/dartz.dart';
import 'package:warframe/core/error/exceptions.dart';
import 'package:warframe/core/usecases/usecases.dart';
import 'package:warframe/features/warframe_codex/domain/repositories/warframe_codex_repository.dart';

class GetWeapons implements UseCase<List<dynamic>?, NoParams> {
  const GetWeapons(this._repository);

  final WarframeCodexRepository _repository;

  @override
  Future<Either<WarframeException, List<dynamic>?>> call(_) async {
    return _repository.weapons();
  }
}
