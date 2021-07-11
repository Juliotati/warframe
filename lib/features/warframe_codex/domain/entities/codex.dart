import 'package:equatable/equatable.dart';

abstract class CodexCategory extends Equatable {
  const CodexCategory({
    required this.name,
    required this.icon,
  });

  final String name;
  final String icon;

  @override
  List<Object?> get props => <String>[name, icon];
}
