library widgets;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warframe/features/warframe_codex/data/models/melee_weapon_model.dart';
import 'package:warframe/features/warframe_codex/data/models/weapon_model.dart';
import 'package:warframe/features/warframe_codex/presentation/screens/weapon_profile.dart';

import '../../../../core/presentation/presentation.dart';
import '../../../../export/warframe_ui.dart';
import '../../data/datasources/warframe_network.dart';
import '../../data/datasources/weapon_network.dart';
import '../../data/models/primary_weapon_model.dart';
import '../../data/models/secondary_weapon_model.dart';
import '../../data/models/warframe_abilities_model.dart';
import '../../data/models/warframe_model.dart';
import '../screens/codex_category_data.dart';

part 'codex_category_item.dart';
part 'codex_data_scaffold.dart';
part 'codex_grid_item.dart';
part 'codex_melee_weapons.dart';
part 'codex_primary_weapons.dart';
part 'codex_secondary_weapons.dart';
part 'codex_warframes.dart';
part 'codex_warframes_list_item.dart';
part 'details_body_wrapper.dart';
part 'warframe_profile_abilities.dart';
part 'warframe_profile_attributes.dart';
part 'profile_thumbnails_and_bios.dart';
part 'weapon_item.dart';
