import 'package:dartz/dartz.dart';
import 'package:warframe/core/error/exceptions.dart';

import 'package:warframe/core/usecases/usecases.dart';
import 'package:warframe/features/warframe_codex/data/models/warframe_model.dart';
import 'package:warframe/features/warframe_codex/domain/repositories/warframe_repository.dart';

class GetWarframe implements UseCase<WarframeModel, Params> {
  const GetWarframe(this._repository);

  final WarframeRepository _repository;

  @override
  Future<Either<WarframeException, WarframeModel>> call(Params params) async {
    return _repository.getWarframe(params.name);
  }
}
