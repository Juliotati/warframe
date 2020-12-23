import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warframe/service/codex.dart';
import 'package:warframe/screens/codex/warfames/widgets/warframe_grid_item.dart';
import 'package:warframe/utilities/scaffold.dart';

class CodexScreen extends StatelessWidget {
  static const route = 'Codex_screen';

  @override
  Widget build(BuildContext context) {
    return WarframeScaffold(
      screenName: 'Codex',
      child: CodexGrid(),
      );
  }
}

class CodexGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final warframeData = Provider.of<CodexWarframes>(context).items;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/ship.jpg'), fit: BoxFit.cover)),
      child: GridView.builder(
          itemCount: warframeData.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 4 / 3,
              crossAxisSpacing: 1.0,
              mainAxisSpacing: 0.0),
          itemBuilder: (ctx, i) {
            return ChangeNotifierProvider.value(
              value: warframeData[i],
              child: WarframeGridItem(),
            );
          }),
    );
  }
}
