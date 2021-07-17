import 'package:equatable/equatable.dart';

abstract class Abilities extends Equatable {
  const Abilities({
    required this.name,
    required this.description,
  }) : super();

  final String name;
  final String description;

  @override
  List<Object?> get props => <String>[name, description];
}
