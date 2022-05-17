import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:warframe/core/error/exceptions.dart';

abstract class UseCase<Type, Params> {
  Future<Either<WarframeException, Type>> call(Params params);
}

abstract class CodexUseCase<Type, NoParams> {
  Future<Either<WarframeException, Type>> call(Params params);
  Either<WarframeException, Type> get(Params params);
}

class Params extends Equatable {
  const Params({
    this.name,
    this.category,
  }) : super();

  final String? name;
  final String? category;

  @override
  List<Object?> get props => <String?>[name, category];
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => <dynamic>[];
}
