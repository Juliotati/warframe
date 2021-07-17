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
        return const CodexPrimaryWeapons();
      case 'secondary':
        return const CodexSecondaryWeapons();
      case 'melee':
        return const CodexMeleeWeapons();
      default:
        return const CodexWarframesListView();
    }
  }
}
