import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:warframe/core/presentation/apis.dart';

import '../models/gun_model.dart';
import '../models/melee_weapon_model.dart';

class WeaponNetwork with ChangeNotifier {
  List<GunModel> guns(String category) {
    return _guns.where((GunModel gun) {
      if (category == 'Companions') {
        return gun.sentinel == true;
      } else {
        return gun.category == category && gun.sentinel != true;
      }
    }).toList(growable: false);
  }

  List<MeleeWeaponModel> get melee => _melee;

  final List<GunModel> _guns = <GunModel>[];
  final List<MeleeWeaponModel> _melee = <MeleeWeaponModel>[];

  /// Gets all Prime and non-prime weapons from the official warframe API on
  /// app launch
  Future<void> getWeapons() async {
    try {
      final http.Response response = await http.get(Uri.parse(API.weaponAPI));
      if (response.statusCode != 200) {
        debugPrint('Failure');
        return;
      }

      List<dynamic>? data = await json.decode(response.body) as List<dynamic>;

      if (_guns.isNotEmpty) {
        debugPrint('''
        DISPOSING OF ${data.length} WEAPONS
        ${_guns.length + _melee.length} ITEMS ALREADY EXIST''');
        data = null;
        return;
      }

      await _sortWeapons(data);
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  /// Adds weapons to their respective category
  Future<void> _sortWeapons(List<dynamic> data) async {
    for (int i = 0; i < data.length; i++) {
      final Map<String, dynamic> _jsonMap = data[i] as Map<String, dynamic>;
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
