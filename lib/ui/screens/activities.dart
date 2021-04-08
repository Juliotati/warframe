import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:warframe/modals/weapon_primary.dart';
import 'package:warframe/service/weapon_network.dart';
import 'package:warframe/ui/utilities/placeholders.dart';
import 'package:warframe/ui/utilities/scaffold.dart';
import 'package:warframe/ui/widgets/weapon_item.dart';

class ActivitiesScreen extends StatefulWidget {
  static const String route = 'activities_screen';

  @override
  _ActivitiesScreenState createState() => _ActivitiesScreenState();
}

class _ActivitiesScreenState extends State<ActivitiesScreen> {
  Future<void> _refresh() async {
    setState(() {
      Provider.of<WeaponNetwork>(context, listen: false)
          .getWeapons('Secondary');
    });
    return;
  }

  @override
  Widget build(BuildContext context) {
    final WeaponNetwork network = Provider.of<WeaponNetwork>(context);
    return WarframeScaffold(
      screenName: 'Weapons',
      isLoader: true,
      onTap: _refresh,
      child: SafeArea(
        child: SafeArea(
          child: RefreshIndicator(
            onRefresh: _refresh,
            child: FutureBuilder<List<PrimaryWeapon>>(
              future: network.getWeapons('Melee'),
              builder: (BuildContext context,
                  AsyncSnapshot<List<PrimaryWeapon>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const LoadingIndicator('GETTING WEAPONS');
                }
                if (snapshot.hasError) {
                  return const WarframeError('NO WEAPONS FOUND');
                } else {
                  final List<PrimaryWeapon> categoryWeapons = snapshot.data
                      .where((PrimaryWeapon element) =>
                          element.category == 'Melee')
                      .toList();
                  return ListView.builder(
                    itemCount: categoryWeapons.length,
                    itemBuilder: (BuildContext context, int i) {
                      return WeaponCardItem(
                        weapon: categoryWeapons[i],
                      );
                    },
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
