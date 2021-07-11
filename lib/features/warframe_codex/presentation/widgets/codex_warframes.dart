import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

import '../../../../export/warframe_ui.dart';
import '../../data/datasources/warframe_network.dart';
import '../widgets/codex_grid_item.dart';
import 'codex_data_scaffold.dart';
import 'codex_warframes_list_item.dart';

class CodexWarframesListView extends StatelessWidget {
  const CodexWarframesListView();

  @override
  Widget build(BuildContext context) {
    return CodexDataScaffold(
      label: 'Warframes',
      body: Consumer<WarframeNetwork>(
        builder: (BuildContext context, WarframeNetwork _network, _) {
          final List<WarframeModel> data = _network.data;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: WarframeListViewBuilder(
              itemCount: data.length,
              itemBuilder: (_, int i) {
                return WarframeListItem(
                  data[i],
                  key: ValueKey<String>(data[i].uniqueName),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class CodexWarframesGridView extends StatelessWidget {
  const CodexWarframesGridView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 0.65),
      body: Consumer<WarframeNetwork>(
        builder: (BuildContext context, WarframeNetwork _network, _) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: _network.data.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: kIsWeb ? 3 : 2,
                mainAxisSpacing: 2.0,
                childAspectRatio: 4 / 3,
                crossAxisSpacing: 2.0,
              ),
              itemBuilder: (_, int i) {
                return CodexGridItem(_network.data[i]);
              },
            ),
          );
        },
      ),
    );
  }
}
