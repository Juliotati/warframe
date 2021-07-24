import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecases.dart';
import '../entities/warframe.dart';
import '../repositories/warframe_repository.dart';

class GetWarframe implements UseCase<Warframe, Params> {
  const GetWarframe(this.repository);

  final WarframeRepository repository;

  @override
  Future<Either<Failure, Warframe>> call(Params params) async {
    return repository.getWarframe(params.name);
  }
}
