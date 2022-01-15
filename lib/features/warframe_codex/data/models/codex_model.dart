import 'package:flutter/widgets.dart';

import 'package:warframe/features/warframe_codex/domain/entities/codex.dart';

class CodexCategoryModel extends CodexCategory {
  const CodexCategoryModel({
    required this.name,
    required this.icon,
  }) : super(name: name, icon: icon);

  final String name;
  final IconData icon;
}
