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

  List<ModModel> _mods = <ModModel>[];
  final List<GunModel> _guns = <GunModel>[];
  List<WarframeModel> _warframes = <WarframeModel>[];
  final List<MeleeWeaponModel> _melee = <MeleeWeaponModel>[];

  List<ModModel> get mods => _mods;

  List<MeleeWeaponModel> get melee => _melee;

  List<WarframeModel> get warframes => _warframes;

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
    await _getWeapons.call(NoParams()).then(
      (Either<WarframeException, List<dynamic>?> result) {
        if (result.isLeft()) return;
        if (result.isRight() && result.getOrElse(() => null) != null) {
          _sortWeapons(result.getOrElse(() => <dynamic>[])!);
        }
      },
    );
  }

  List<GunModel> guns(String category) {
    try {
      final bool _isCompanion = category.toLowerCase() == 'companions';
      if (_isCompanion && !_gunsContainsCompanions) return <GunModel>[];

      return _guns.where((GunModel gun) {
        if (_isCompanion) return gun.sentinel == true;

        return gun.category == category && gun.sentinel != true;
      }).toList();
    } catch (_) {
      return <GunModel>[];
    }
  }

  bool get _gunsContainsCompanions {
    try {
      _guns.firstWhere((GunModel gun) => gun.category == 'companions');

      return true;
    } catch (_) {
      return false;
    }
  }

  /// [API.weaponsAPI] returns all the weapons available without any filtering.
  /// This internal methods is responsible for organizing the weapons by
  /// their respective category namely, Primary, Secondary and Melee.
  Future<void> _sortWeapons(List<dynamic> decodedWeapons) async {
    _guns.clear();
    _melee.clear();
    for (int i = 0; i < decodedWeapons.length; i++) {
      final Map<String, dynamic> _weapon =
          decodedWeapons[i] as Map<String, dynamic>;

      final String category = (_weapon['category'] as String).toLowerCase();

      switch (category) {
        case 'primary':
        case 'secondary':
          try {
            _guns.add(GunModel.fromJson(_weapon));
          } catch (e) {
            debugPrint('$e');
            continue;
          }
          continue;
        case 'melee':
          try {
            final MeleeWeaponModel meleeWeapon = MeleeWeaponModel.fromJson(
              _weapon,
            );
            if (_isDuplicateMelee(meleeWeapon.name)) continue;
            _melee.add(meleeWeapon);
          } catch (e) {
            debugPrint(e.toString());
            continue;
          }
      }
    }
    notifyListeners();
  }

  bool _isDuplicateMelee(String name) {
    try {
      _melee.firstWhere((MeleeWeaponModel melee) {
        return melee.name == name;
      });
      return true;
    } catch (_) {
      return false;
    }
  }
}
