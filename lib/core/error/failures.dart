import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure([this.properties = const <dynamic>[]]) : super();

  final List<dynamic> properties;

  @override
  List<Object?> get props => <dynamic>[properties];
}
