import 'package:dartz/dartz.dart';
import 'package:warframe/core/error/exceptions.dart';

import 'package:warframe/core/usecases/usecases.dart';
import 'package:warframe/features/warframe_codex/data/models/warframe_model.dart';
import 'package:warframe/features/warframe_codex/domain/repositories/warframe_codex_repository.dart';

class GetWarframe implements CodexUseCases<dynamic, NoParams> {
  const GetWarframe(this._repository);

  final WarframeCodexRepository _repository;

  @override
  Future<Either<WarframeException, void>> call(_) async {
    return _repository.getWarframes();
  }

  @override
  Either<WarframeException, WarframeModel> get(Params params) {
    return _repository.warframe(params.name!);
  }

  @override
  Either<WarframeException, List<WarframeModel>?> getData(Params params) {
    return _repository.warframes();
  }
}
