import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:warframe/core/error/exceptions.dart';
import 'package:warframe/core/usecases/usecases.dart';
import 'package:warframe/features/warframe_codex/data/models/gun_model.dart';
import 'package:warframe/features/warframe_codex/data/models/melee_weapon_model.dart';
import 'package:warframe/features/warframe_codex/data/models/mod_model.dart';
import 'package:warframe/features/warframe_codex/data/models/warframe_model.dart';
import 'package:warframe/features/warframe_codex/domain/usecases/get_mods.dart';
import 'package:warframe/features/warframe_codex/domain/usecases/get_warframe.dart';
import 'package:warframe/features/warframe_codex/domain/usecases/get_weapons.dart';

class WarframeCodexProvider with ChangeNotifier {
  WarframeCodexProvider(
    this._getMods,
    this._getWarframe,
    this._getWeapons,
  );

  final GetMods _getMods;
  final GetWarframes _getWarframe;
  final GetWeapons _getWeapons;

  List<WarframeModel> _warframes = <WarframeModel>[];
  List<ModModel> _mods = <ModModel>[];

  List<WarframeModel> get warframes => _warframes;

  List<ModModel> get mods => _mods;

  Future<void> initializeCodex() async {
    getWarframes();
    getWeapons();
    getMods();
  }

  Future<void> getWarframes() async {
    await _getWarframe.call(NoParams()).then(
      (Either<WarframeException, List<WarframeModel>?> result) {
        if (result.isLeft()) return;

        _warframes = result.getOrElse(() => <WarframeModel>[])!;
        notifyListeners();
      },
    );
  }

  WarframeModel warframe(String name) {
    return _warframes.firstWhere((WarframeModel element) {
      return element.uniqueName == name;
    });
  }

  Future<void> getMods() async {
    await _getMods.call(NoParams()).then(
          (Either<WarframeException, List<ModModel>?> result) {
        if (result.isLeft()) return;

        _mods = result.getOrElse(() => <ModModel>[])!;
        notifyListeners();
      },
    );
  }

  ModModel mod(String name) {
    return _mods.firstWhere((ModModel element) {
      return element.uniqueName == name;
    });
  }

  Future<void> getWeapons() async {
    await _getWeapons.call(const Params());
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
