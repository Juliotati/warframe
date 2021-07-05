import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warframe/service/warframe_network.dart';
import 'package:warframe/service/weapon_network.dart';
import 'package:warframe/ui/utilities/utilities.dart';
import 'package:warframe/ui/widgets/codex_grid_item.dart';
import 'package:warframe/ui/widgets/weapon_item.dart';

class CodexCategoryData extends StatelessWidget {
 const CodexCategoryData();
  static const String route = 'codex-category-data';
  @override
  Widget build(BuildContext context) {
    final String _category =
        ModalRoute.of(context)!.settings.arguments! as String;
    switch (_category) {
      case 'Warframe':
        return const CodexDataWarframes();
      default:
        return CodexDataWeapons(category: _category);
    }
  }
}

class CodexDataWarframes extends StatelessWidget {
  const CodexDataWarframes();
  @override
  Widget build(BuildContext context) {
    return WarframeScaffold(
      screenName: 'Warframe',
      child: Consumer<WarframeNetwork>(
        builder: (BuildContext context, WarframeNetwork _network, _) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: _network.data.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 2.0,
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
class CodexDataWeapons extends StatelessWidget {
  const CodexDataWeapons({Key? key, this.category}) : super(key: key);

  static const String route = 'codex_weapon_category';

  final String? category;

  @override
  Widget build(BuildContext context) {
    return WarframeScaffold(
      screenName: category,
      child: SafeArea(
        child: Consumer<WeaponNetwork>(
          builder: (BuildContext context, WeaponNetwork _network, _) {
            return ListView.builder(
              itemCount: _network.data.length,
              itemBuilder: (BuildContext context, int i) {
                return WeaponCardItem(
                  weapon: _network.getWeapon(category!)[i],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
