import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../models/melee_weapon_model.dart';
import '../models/primary_weapon_model.dart';
import '../models/secondary_weapon_model.dart';

enum WeaponCategory {
  primary,
  secondary,
  melee,
}

class WeaponNetwork with ChangeNotifier {
  static const String _baseUrl = 'https://api.warframestat.us/weapons/';

  List<Map<String, dynamic>> get data => _weapons;

  List<PrimaryWeaponModel> get primary => _primary;

  List<SecondaryWeaponModel> get secondary => _secondary;

  List<MeleeWeaponModel> get melee => _melee;

  final List<Map<String, dynamic>> _weapons = <Map<String, dynamic>>[];
  final List<PrimaryWeaponModel> _primary = <PrimaryWeaponModel>[];
  final List<SecondaryWeaponModel> _secondary = <SecondaryWeaponModel>[];
  final List<MeleeWeaponModel> _melee = <MeleeWeaponModel>[];

  /// Gets all Prime and non-prime weapons from the official warframe API on
  /// app launch
  Future<void> getWeapons() async {
    final http.Response response = await http.get(Uri.parse(_baseUrl));

    final List<dynamic> data =
        await json.decode(response.body) as List<dynamic>;

    sortWeapons(data);
  }

  /// Adds weapons to their respective category
  void sortWeapons(List<dynamic> data) {
    for (int i = 0; i < data.length; i++) {
      final Map<String, dynamic> _jsonMap = data[i] as Map<String, dynamic>;
      final String category = _jsonMap['category'] as String;

      if (category == 'Primary') {
        _primary.add(PrimaryWeaponModel.fromJson(_jsonMap));
      } else if (category == 'Secondary') {
        _secondary.add(SecondaryWeaponModel.fromJson(_jsonMap));
      } else if (category == 'Melee') {
        _melee.add(MeleeWeaponModel.fromJson(_jsonMap));
      }
      notifyListeners();
    }
  }
}
