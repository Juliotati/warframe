import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:warframe/core/keys/apis.dart';
import 'package:warframe/core/platform/network_info.dart';

import 'package:warframe/features/warframe_codex/data/models/gun_model.dart';
import 'package:warframe/features/warframe_codex/data/models/melee_weapon_model.dart';

abstract class WeaponRemoteDatasource {
  /// Gets all Prime and non-prime weapons from the official warframe API on app launch
  /// Rethrows an [Error] if something goes wrong
  Future<void> getRemoteWeapons();
}

class WeaponNetwork extends WeaponRemoteDatasource with ChangeNotifier {
  List<MeleeWeaponModel> get melee => _melee;

  final List<GunModel> _guns = <GunModel>[];
  final List<MeleeWeaponModel> _melee = <MeleeWeaponModel>[];

  List<GunModel>? guns(String category) {
    try {
      final bool _isCompanion = category.toLowerCase() == 'companions';
      if (_isCompanion && !_gunsContainsCompanions(category)) return null;

      return _guns.where((GunModel gun) {
        if (_isCompanion) return gun.sentinel == true;

        return gun.category == category && gun.sentinel != true;
      }).toList();
    } catch (_) {
      return null;
    }
  }

  bool _gunsContainsCompanions(String category) {
    try {
      _guns.firstWhere((GunModel gun) => gun.category == 'companions');

      return true;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<void> getRemoteWeapons() async {
    final bool isConnected = await NetWorkInfoImpl.instance.isConnected;

    if (!isConnected) return;
    try {
      final http.Response response = await http.get(Uri.parse(API.weaponsAPI));
      if (response.statusCode != 200) {
        debugPrint('Failure');
        return;
      }

      List<dynamic>? decodedWeapons =
          await json.decode(response.body) as List<dynamic>;

      if (_guns.isNotEmpty) {
        debugPrint(
          '''
        DISPOSING OF ${decodedWeapons.length} WEAPONS
        ${_guns.length + _melee.length} ITEMS ALREADY EXIST''',
        );
        decodedWeapons = null;
        return;
      }

      await _sortWeapons(decodedWeapons);
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  /// Adds weapons to their respective category
  /// Rethrows an [Error] if something goes wrong
  Future<void> _sortWeapons(List<dynamic> decodedWeapons) async {
    for (int i = 0; i < decodedWeapons.length; i++) {
      final Map<String, dynamic> _jsonMap =
          decodedWeapons[i] as Map<String, dynamic>;
      final String category = _jsonMap['category'] as String;
      final bool isGunType = category == 'Primary' || category == 'Secondary';

      if (isGunType) {
        try {
          _guns.add(GunModel.fromJson(_jsonMap));
        } catch (e) {
          debugPrint(e.toString());
          rethrow;
        }
      }
      if (category == 'Melee') {
        try {
          _melee.add(MeleeWeaponModel.fromJson(_jsonMap));
        } catch (e) {
          debugPrint(e.toString());
          rethrow;
        }
      }
    }
  }
}
