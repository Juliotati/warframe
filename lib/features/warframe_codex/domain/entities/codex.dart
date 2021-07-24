import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

abstract class CodexCategory extends Equatable {
  const CodexCategory({
    required this.name,
    required this.icon,
  });

  final String name;
  final IconData icon;

  @override
  List<Object?> get props => <dynamic>[name, icon];
}
