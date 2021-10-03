library warframe_codex;

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animations/animations.dart';
import 'package:warframe/core/utilities/platform.dart';
import 'package:warframe/features/warframe_codex/data/datasources/mods_remote_datasource.dart';
import 'package:warframe/features/warframe_codex/data/models/codex_model.dart';

import 'package:warframe/features/warframe_codex/data/models/melee_weapon_model.dart';
import 'package:warframe/features/warframe_codex/data/models/mod_model.dart';
import 'package:warframe/features/warframe_codex/data/models/weapon_model.dart';

import '../../../../core/presentation/presentation.dart';
import 'data/datasources/warframe_remote_datasource.dart';
import 'data/datasources/weapon_remote_datasource.dart';
import 'data/models/gun_model.dart';
import 'data/models/warframe_abilities_model.dart';
import 'data/models/warframe_model.dart';

part 'presentation/screens/codex_category_data.dart';
part 'presentation/screens/codex_categories.dart';
part 'presentation/screens/warframe_profile.dart';
part 'presentation/screens/weapon_profile.dart';

part 'presentation/widgets/codex_category_item.dart';
part 'presentation/widgets/codex_data_scaffold.dart';
part 'presentation/widgets/codex_melee_weapons.dart';
part 'presentation/widgets/codex_guns.dart';
part 'presentation/widgets/codex_mods.dart';
part 'presentation/widgets/codex_warframes.dart';
part 'presentation/widgets/codex_warframes_list_item.dart';
part 'presentation/widgets/details_body_wrapper.dart';
part 'presentation/widgets/mod_item.dart';
part 'presentation/widgets/profile_thumbnails_and_bios.dart';
part 'presentation/widgets/warframe_profile_abilities.dart';
part 'presentation/widgets/warframe_profile_attributes.dart';
part 'presentation/widgets/weapon_item.dart';
part 'presentation/widgets/weapon_melee_stats.dart';
part 'presentation/widgets/guns_stats.dart';
