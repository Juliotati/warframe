import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../export/warframe_ui.dart';
import '../../data/datasources/weapon_network.dart';
import '../../data/models/secondary_weapon_model.dart';
import 'codex_data_scaffold.dart';
import 'weapon_item.dart';

class CodexSecondaryWeapons extends StatelessWidget {
  const CodexSecondaryWeapons({Key? key}) : super(key: key);

  static const String route = 'codex-secondary-weapons';

  @override
  Widget build(BuildContext context) {
    final List<SecondaryWeaponModel> data =
        context.watch<WeaponNetwork>().secondary;

    return CodexDataScaffold(
      label: 'Secondary',
      body: data.isEmpty
          ? const LoadingIndicator('Loading Secondary Weapons')
          : WarframeListViewBuilder(
              itemCount: data.length,
              itemBuilder: (_, int i) {
                return SecondaryWeaponCard(
                  key: ValueKey<String>(data[i].uniqueName),
                  weapon: data[i],
                );
              },
            ),
    );
  }
}
