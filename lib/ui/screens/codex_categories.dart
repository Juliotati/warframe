import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:warframe/modals/codex_modals.dart';
import 'package:warframe/ui/utilities/codex_categories.dart';
import 'package:warframe/ui/utilities/scaffold.dart';

import 'codex_grid.dart';

class CodexScreen extends StatelessWidget {
  static const String route = 'Codex_screen';

  @override
  Widget build(BuildContext context) {
    return WarframeScaffold(
      screenName: 'Codex',
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: kCodexCategories
            .map((CodexCategory category) => CodexCategoryItem(category.name))
            .toList(),
      ),
    );
  }
}

class CodexCategoryItem extends StatelessWidget {
  const CodexCategoryItem(
    this.category, {
    Key key,
  }) : super(key: key);
  final String category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(
        context,
        CodexGrid.route,
        arguments: category,
      ),
      child: Container(
        color: Colors.white,
        height: 50,
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(
          horizontal: 4,
          vertical: 2,
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            category,
            style: Theme.of(context).textTheme.headline5.copyWith(
                  color: const Color.fromRGBO(0, 0, 0, 1.0),
                ),
          ),
        ),
      ),
    );
  }
}