import '../../domain/entities/codex.dart';

class CodexCategoryModel extends CodexCategory {
  const CodexCategoryModel({
    required this.name,
    required this.icon,
  }) : super(name: name, icon: icon);

  final String name;
  final String icon;
}
