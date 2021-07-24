import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../error/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class Params extends Equatable {
  const Params(this.name) : super();
  final String name;

  @override
  List<Object?> get props => <String>[name];
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => <dynamic>[];
}
