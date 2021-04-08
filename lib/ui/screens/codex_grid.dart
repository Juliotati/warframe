import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warframe/modals/warframe.dart';
import 'package:warframe/service/warframe_network.dart';
import 'package:warframe/ui/utilities/placeholders.dart';
import 'package:warframe/ui/utilities/scaffold.dart';
import 'package:warframe/ui/widgets/codex_grid_item.dart';

class CodexGrid extends StatefulWidget {
  static const String route = 'codex_grid';

  @override
  _CodexGridState createState() => _CodexGridState();
}

class _CodexGridState extends State<CodexGrid> {

  Future<void> _refresh() async {
    await Provider.of<WarframeNetwork>(context, listen: false).getWarframes();
    setState(() {});
    return;
  }
  @override
  Widget build(BuildContext context) {
    final WarframeNetwork _network = Provider.of<WarframeNetwork>(context);
    return WarframeScaffold(
      screenName: 'Codex',
      child: SafeArea(
        child: RefreshIndicator(
          onRefresh: _refresh,
          child: FutureBuilder<List<Warframe>>(
            future: _network.getAllWarframes(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Warframe>> snapshot) {
              final List<Warframe> _data = snapshot.data;
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const LoadingIndicator();
              }
              if (snapshot.hasError) {
                return const WarframeError('NO WARFRAMES FOUND');
              } else {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: GridView.builder(
                    itemCount: _data.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 4 / 3,
                      crossAxisSpacing: 2.0,
                    ),
                    itemBuilder: (BuildContext context, int i) {
                      int warframeType() {
                        if (_data[i].name.contains('Prime')) {
                          return 1;
                        } else {
                          return 0;
                        }
                      }
                      return CodexGridItem(
                        warframe: _data[i],
                        type: warframeType(),
                      );
                    },
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
