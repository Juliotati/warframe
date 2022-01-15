import 'package:warframe/core/usecases/usecases.dart';
import 'package:warframe/features/warframe_codex/data/models/gun_model.dart';
import 'package:warframe/features/warframe_codex/data/models/melee_weapon_model.dart';
import 'package:warframe/features/warframe_codex/data/models/mod_model.dart';
import 'package:warframe/features/warframe_codex/data/models/warframe_model.dart';
import 'package:warframe/features/warframe_codex/domain/usecases/get_mods.dart';
import 'package:warframe/features/warframe_codex/domain/usecases/get_warframe.dart';
import 'package:warframe/features/warframe_codex/domain/usecases/get_weapons.dart';

class WarframeCodexProvider {
  const WarframeCodexProvider(
    this._getMods,
    this._getWarframe,
    this._getWeapons,
  );

  final GetMods _getMods;
  final GetWarframe _getWarframe;
  final GetWeapons _getWeapons;

  Future<void> getMods() async {
    await _getMods.call(const Params());
  }

  Future<void> getWarframes() async {
    await _getWarframe.call(const Params());
  }

  Future<void> getWeapons() async {
    await _getWeapons.call(const Params());
  }

  List<WarframeModel>? get warframes {
    return _getWarframe.getData(const Params()).getOrElse(() {
      return <WarframeModel>[];
    });
  }

  WarframeModel warframe(String name) {
    return _getWarframe.get(Params(name: name)).getOrElse(() {
      return WarframeModel.empty();
    });
  }

  List<ModModel> get mods {
    return _getMods.get(const Params()).getOrElse(() => <ModModel>[]);
  }

  dynamic weapons([String? category]) {
    if (category == null) {
      return _getWeapons.get(const Params()).getOrElse(() {
        return <MeleeWeaponModel>[];
      });
    }
    return _getWeapons.get(Params(category: category)).getOrElse(() {
      return <GunModel>[];
    });
  }
}
