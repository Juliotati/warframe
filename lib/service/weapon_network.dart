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
  /// Gets in game weapon based on the chosen category
  Future<List<PrimaryWeapon>> getWeapons(String category) async {
    const String url = 'https://api.warframestat.us/weapons/';
    final http.Response response = await http.get(url);

    final List<dynamic> _data = await json.decode(response.body);

    final Iterable<PrimaryWeapon> _weapons =
        _data.map((weapon) => PrimaryWeapon.fromJson(weapon)).toList();

    final List<PrimaryWeapon> categoryWeapons = _weapons
        .where((PrimaryWeapon element) => element.category == category)
        .toList();

    return categoryWeapons;
  }
}
