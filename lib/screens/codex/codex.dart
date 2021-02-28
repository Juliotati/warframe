import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:warframe/modals/codex_modals.dart';
import 'package:warframe/screens/codex/codex_widgets/codex_grid.dart';
import 'package:warframe/service/codex.dart';
import 'package:warframe/utilities/scaffold.dart';

class CodexScreen extends StatelessWidget {
  static const String route = 'Codex_screen';

  @override
  Widget build(BuildContext context) {
    return WarframeScaffold(
      screenName: 'Codex',
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: CODEX_CATEGORIES
            .map(
              (CodexCategory category) => InkWell(
                onTap: () => Navigator.pushNamed(context, CodexGrid.route),
                child: Container(
                  color: Colors.white,
                  height: 50,
                  width: 350,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(1),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      category.name,
                      style: Theme.of(context).textTheme.headline5.copyWith(
                            color: Colors.black,
                          ),
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
