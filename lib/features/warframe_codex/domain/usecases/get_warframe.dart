import 'package:dartz/dartz.dart';
import 'package:warframe/core/error/exceptions.dart';

import 'package:warframe/core/usecases/usecases.dart';
import 'package:warframe/features/warframe_codex/data/models/warframe_model.dart';
import 'package:warframe/features/warframe_codex/domain/repositories/warframe_codex_repository.dart';

class GetWarframes implements UseCase<List<WarframeModel>?, NoParams> {
  const GetWarframes(this._repository);

  final WarframeCodexRepository _repository;

  @override
  Future<Either<WarframeException, List<WarframeModel>?>> call(_) {
    return _repository.warframes();
  }
}
