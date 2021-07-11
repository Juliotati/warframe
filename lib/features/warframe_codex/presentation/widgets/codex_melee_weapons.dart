import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../export/warframe_ui.dart';
import '../../data/datasources/weapon_network.dart';
import '../../data/models/melee_weapon_model.dart';
import 'codex_data_scaffold.dart';
import 'weapon_item.dart';

class CodexMeleeWeapons extends StatelessWidget {
  const CodexMeleeWeapons({
    Key? key,
  }) : super(key: key);

  static const String route = 'codex-melee-weapons';

  @override
  Widget build(BuildContext context) {
    final List<MeleeWeaponModel> data = context.watch<WeaponNetwork>().melee;

    return CodexDataScaffold(
      label: 'Melee',
      body: data.isEmpty
          ? const LoadingIndicator('Loading Melee Weapons')
          : WarframeListViewBuilder(
              itemCount: data.length,
              itemBuilder: (_, int i) {
                return MeleeWeaponCard(
                  key: ValueKey<String>(data[i].uniqueName),
                  weapon: data[i],
                );
              },
            ),
    );
  }
}
