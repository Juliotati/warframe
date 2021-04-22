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

  /// API for getting  a single weapon based on the category provided
  List<PrimaryWeapon> getWeapon(String category) {
    return _weapons
        .where((PrimaryWeapon weapon) => weapon.category == category)
        .toList();
  }

  /// Gets in game weapon based on the chosen category
  Future<void> getWeapons() async {
    const String url = 'https://api.warframestat.us/weapons/';
    final http.Response response = await http.get(url);

    final List<dynamic> _data = await json.decode(response.body);

    final Iterable<PrimaryWeapon> _weaponsData =
        _data.map((weapon) => PrimaryWeapon.fromJson(weapon)).toList();

    if (_weapons.isEmpty) {
      _weapons.addAll(_weaponsData);
      print(_weapons.length);
    }
  }
}
