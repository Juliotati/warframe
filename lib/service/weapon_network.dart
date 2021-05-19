import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:warframe/modals/weapon_primary.dart';

enum WeaponCategory {
  primary,
  secondary,
  melee,
}

class WeaponNetwork with ChangeNotifier {
  List<PrimaryWeapon> get data => _weapons;

  final List<PrimaryWeapon> _weapons = <PrimaryWeapon>[];

  /// Gets weapons from the provided category from the local list of weapons
  /// previsouly populated.
  List<PrimaryWeapon> getWeapon(String category) {
    return _weapons.where((PrimaryWeapon weapon) {
      return weapon.category == category;
    }).toList();
  }

  /// Gets all Prime and non-prime weapons from the official warframe API
  Future<void> getWeapons() async {
    const String url = 'https://api.warframestat.us/weapons/';

    final http.Response response = await http.get(url);

    final List<dynamic> _data = await json.decode(response.body) as List<dynamic>;

    final Iterable<PrimaryWeapon> _weaponsData = _data.map((w) => PrimaryWeapon.fromJson(w as Map<String, dynamic>)).toList();

    if (_weapons.isEmpty) _weapons.addAll(_weaponsData);
  }
}
