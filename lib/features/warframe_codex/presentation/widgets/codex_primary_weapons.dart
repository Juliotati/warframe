import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/presentation/presentation.dart';
import '../../data/datasources/weapon_network.dart';
import '../../data/models/primary_weapon_model.dart';
import 'codex_data_scaffold.dart';
import 'weapon_item.dart';

class CodexPrimaryWeapons extends StatelessWidget {
  const CodexPrimaryWeapons({Key? key}) : super(key: key);

  static const String route = 'codex-primary-weapons';

  @override
  Widget build(BuildContext context) {
    final List<PrimaryWeaponModel> data =
        context.watch<WeaponNetwork>().primary;

    return CodexDataScaffold(
      label: 'Primary',
      body: data.isEmpty
          ? const LoadingIndicator('Loading Primary Weapons')
          : WarframeListViewBuilder(
              itemCount: data.length,
              itemBuilder: (_, int i) {
                return PrimaryWeaponCard(
                  key: ValueKey<String>(data[i].uniqueName),

                  weapon: data[i],
                );
              },
            ),
    );
  }
}
