import 'package:dartz/dartz.dart';
import 'package:warframe/core/error/exceptions.dart';
import 'package:warframe/features/warframe_codex/data/models/gun_model.dart';
import 'package:warframe/features/warframe_codex/data/models/melee_weapon_model.dart';
import 'package:warframe/features/warframe_codex/data/models/mod_model.dart';
import 'package:warframe/features/warframe_codex/data/models/warframe_model.dart';

abstract class WarframeCodexRepository {
  Future<Either<WarframeException, List<WarframeModel>?>> warframes();
  Future<Either<WarframeException, void>> getWeapons();
  Future<Either<WarframeException, List<ModModel>?>> mods();
  Either<WarframeException, List<GunModel>?> guns(String category);
   Either<WarframeException, List<MeleeWeaponModel>> melees();
}
