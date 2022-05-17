import 'package:dartz/dartz.dart';
import 'package:warframe/core/error/exceptions.dart';
import 'package:warframe/core/usecases/usecases.dart';
import 'package:warframe/features/warframe_codex/data/models/mod_model.dart';
import 'package:warframe/features/warframe_codex/domain/repositories/warframe_codex_repository.dart';

class GetMods implements UseCase<List<ModModel>?, NoParams> {
  const GetMods(this._repository);

  final WarframeCodexRepository _repository;

  @override
  Future<Either<WarframeException, List<ModModel>?>> call(_) async {
    return _repository.mods();
  }
}
