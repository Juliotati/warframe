import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:warframe/core/presentation/apis.dart';

import '../models/gun_model.dart';
import '../models/melee_weapon_model.dart';

class WeaponNetwork with ChangeNotifier {
  List<GunModel> guns(String category) => _guns.where((GunModel gun) {
        if (category == 'Companions') {
          
          return gun.sentinel == true && gun.name.startsWith('A');
        } else {
          return gun.category == category && gun.sentinel != true;
        }
      }).toList(growable: false);
      
  List<MeleeWeaponModel> get melee => _melee;

  final List<GunModel> _guns = <GunModel>[];
  final List<MeleeWeaponModel> _melee = <MeleeWeaponModel>[];

  /// Gets all Prime and non-prime weapons from the official warframe API on
  /// app launch
  Future<void> getWeapons() async {
    final http.Response response = await http.get(Uri.parse(API.weaponAPI));

    final List<dynamic> data =
        await json.decode(response.body) as List<dynamic>;

    sortWeapons(data);
  }

  /// Adds weapons to their respective category
  void sortWeapons(List<dynamic> data) {
    for (int i = 0; i < data.length; i++) {
      final Map<String, dynamic> _jsonMap = data[i] as Map<String, dynamic>;
      final String category = _jsonMap['category'] as String;
      final bool isGun = category == 'Primary' || category == 'Secondary';
      if (isGun) {
        _guns.add(GunModel.fromJson(_jsonMap));
      } else if (category == 'Melee') {
        _melee.add(MeleeWeaponModel.fromJson(_jsonMap));
      }
      notifyListeners();
    }
  }
}
