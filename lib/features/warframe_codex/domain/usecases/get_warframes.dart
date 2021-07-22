import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecases.dart';
import '../entities/warframe.dart';
import '../repositories/warframe_repository.dart';

class GetWarframes implements UseCase<List<Warframe>, NoParams> {
  const GetWarframes(this.repository);

  final WarframeRepository repository;

  @override
  Future<Either<Failure, List<Warframe>>> call(NoParams params) async {
    return repository.getWarframes();
  }
}
