import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class CodexCategoryData extends StatelessWidget {
  const CodexCategoryData();
  static const String route = 'codex-category-items';
  @override
  Widget build(BuildContext context) {
    final String _category =
        ModalRoute.of(context)!.settings.arguments! as String;
    final String category = _category.toLowerCase();
    switch (category) {
      case 'warframe':
        return const CodexWarframesListView();
      case 'primary':
        return CodexGuns(_category);
      case 'secondary':
        return CodexGuns(_category);
      case 'melee':
        return const CodexMeleeWeapons();
      case 'companions':
        return CodexGuns(_category);
      case 'mods':
        return const CodexModsListView();
      default:
        return const CodexWarframesListView();
    }
  }
}
