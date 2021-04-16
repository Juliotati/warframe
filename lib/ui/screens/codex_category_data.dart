import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warframe/modals/warframe.dart';
import 'package:warframe/modals/weapon_primary.dart';
import 'package:warframe/service/warframe_network.dart';
import 'package:warframe/service/weapon_network.dart';
import 'package:warframe/ui/utilities/placeholders.dart';
import 'package:warframe/ui/utilities/scaffold.dart';
import 'package:warframe/ui/widgets/codex_grid_item.dart';
import 'package:warframe/ui/widgets/weapon_item.dart';

class CodexGrid extends StatefulWidget {
  static const String route = 'codex_grid';

  @override
  _CodexGridState createState() => _CodexGridState();
}

class _CodexGridState extends State<CodexGrid> {
  @override
  Widget build(BuildContext context) {
    final String _category = ModalRoute.of(context).settings.arguments;
    switch (_category) {
      case 'Warframe':
        return const CodexDataWarframes();
      default:
        return CodexDataWeapons(category: _category);
    }
  }
}

class CodexDataWarframes extends StatefulWidget {
  const CodexDataWarframes();

  @override
  _CodexDataWarframesState createState() => _CodexDataWarframesState();
}

class _CodexDataWarframesState extends State<CodexDataWarframes> {
  Future<void> _refresh() async {
    await Provider.of<WarframeNetwork>(context, listen: false).getWarframes();
    setState(() {});
    return;
  }

  @override
  Widget build(BuildContext context) {
    final WarframeNetwork _network = Provider.of<WarframeNetwork>(context);
    return RefreshIndicator(
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
    );
  }
}

class CodexDataWeapons extends StatefulWidget {
  const CodexDataWeapons({Key key, this.category}) : super(key: key);

  static const String route = 'codex_weapon_category_screen';

  final String category;

  @override
  _CodexDataWeaponsState createState() => _CodexDataWeaponsState();
}

class _CodexDataWeaponsState extends State<CodexDataWeapons> {
  Future<void> _refresh() async {
    setState(() {
      Provider.of<WeaponNetwork>(context, listen: false)
          .getWeapons(widget.category);
    });
    return;
  }

  @override
  Widget build(BuildContext context) {
    final WeaponNetwork network = Provider.of<WeaponNetwork>(context);
    return WarframeScaffold(
      screenName: widget.category,
      isLoader: true,
      onTap: _refresh,
      child: SafeArea(
        child: RefreshIndicator(
          onRefresh: _refresh,
          child: FutureBuilder<List<PrimaryWeapon>>(
            future: network.getWeapons(widget.category),
            builder: (BuildContext context,
                AsyncSnapshot<List<PrimaryWeapon>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return LoadingIndicator('Getting ${widget.category} Weapons');
              }
              if (snapshot.hasError) {
                return WarframeError('No ${widget.category} Weapons Found');
              } else {
                final List<PrimaryWeapon> weapons = snapshot.data;
                return ListView.builder(
                  itemCount: weapons.length,
                  itemBuilder: (BuildContext context, int i) {
                    return WeaponCardItem(
                      weapon: weapons[i],
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
