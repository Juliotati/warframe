import 'package:dartz/dartz.dart';
import 'package:warframe/core/error/exceptions.dart';
import 'package:warframe/core/usecases/usecases.dart';
import 'package:warframe/features/warframe_codex/domain/repositories/warframe_codex_repository.dart';

class GetWeapons implements CodexUseCase<void, NoParams> {
  const GetWeapons(this._repository);

  final WarframeCodexRepository _repository;

  @override
  Future<Either<WarframeException, void>> call(_) async {
    return _repository.getWeapons();
  }

  @override
  Either<WarframeException, dynamic> get(Params params) {
    if (params.category == null) return _repository.melees();
    return _repository.guns(params.category!);
  }
}
