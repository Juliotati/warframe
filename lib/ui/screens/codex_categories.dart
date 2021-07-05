import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:warframe/modals/codex_modals.dart';
import 'package:warframe/ui/utilities/utilities.dart';
import 'package:warframe/ui/widgets/codex_category_item.dart';


class CodexCategories extends StatelessWidget {
  const CodexCategories();

  static const String route = 'codex-categories';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: kCodexCategories.map((CodexCategory category) {
        return CodexCategoryItem(category.name);
      }).toList(),
    );
  }
}


