import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warframe/modals/weapon_primary.dart';
import 'package:warframe/service/warframe_network.dart';
import 'package:warframe/service/weapon_network.dart';
import 'package:warframe/ui/utilities/placeholders.dart';
import 'package:warframe/ui/utilities/scaffold.dart';
import 'package:warframe/ui/widgets/codex_grid_item.dart';
import 'package:warframe/ui/widgets/weapon_item.dart';

class CodexCategoryData extends StatelessWidget {
  static const String route = 'codex_grid';
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

/// Displayed when "warframe" is chosen from codex categories
class CodexDataWarframes extends StatelessWidget {
  const CodexDataWarframes();
  @override
  Widget build(BuildContext context) {
    return WarframeScaffold(
      screenName: 'Warframe',
      child: Consumer<WarframeNetwork>(
        builder: (BuildContext context, WarframeNetwork _network, _) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: GridView.builder(
              itemCount: _network.data.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 4 / 3,
                crossAxisSpacing: 2.0,
              ),
              itemBuilder: (BuildContext context, int i) {
                return CodexGridItem(
                  warframe: _network.data[i],
                );
              },
            ),
          );
        },
      ),
    );
  }
}

/// Displayed when any type of weapon is chosen from codex categories
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
