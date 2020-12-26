import 'package:flutter/cupertino.dart';
import 'package:warframe/screens/codex/codex_widgets/codex_grid_item.dart';
import 'package:warframe/service/codex.dart';
import 'package:warframe/utilities/scaffold.dart';

class CodexGrid extends StatelessWidget {
  static const String route = 'codex_grid';

  /// TODO: check items to display based on the category received
  @override
  Widget build(BuildContext context) {
    return WarframeScaffold(
      screenName: 'Codex',
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 4 / 3,
              crossAxisSpacing: 2.0,
              mainAxisSpacing: 0.0,
            ),
            children: CODEX_WARFRAME
                .map((name) => CodexGridItem(name: name))
                .toList(),
          ),
      ),
    );
  }
}
