import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:warframe/core/keys/apis.dart';
import 'package:warframe/core/platform/network_info.dart';
import 'package:warframe/features/warframe_codex/data/models/mod_model.dart';

abstract class ModsRemoteDatasource {
  /// Gets all Prime and non-prime mods from the official warframe API on app launch
  /// Rethrows an [Error] if something goes wrong
  Future<void> mods();
}

class ModsRemoteDatasourceImpl extends ModsRemoteDatasource {
  @override
  Future<List<ModModel>?> mods() async {
    final http.Response response = await http.get(Uri.parse(API.modsAPI));

    if (response.statusCode != 200) return null;

    final List<dynamic> decodedMods =
        await jsonDecode(response.body) as List<dynamic>;

    return _nonDuplicateMods(decodedMods);
  }

  Future<List<ModModel>> _nonDuplicateMods(List<dynamic> decodedMods) async {
    final List<ModModel> _mods = <ModModel>[];
    for (int i = 0; i < decodedMods.length; i++) {
      final Map<String, dynamic> _mod = decodedMods[i] as Map<String, dynamic>;
      try {
        final String currentModName = _mod['name'] as String;

        final int _nextMod = i + 1;

        // ignore: avoid_dynamic_calls
        final String nextModName = decodedMods[_nextMod]['name'] as String;

        // ignore: avoid_dynamic_calls
        if (currentModName != nextModName) _mods.add(ModModel.fromJson(_mod));

        // ignore: avoid_catching_errors
      } on RangeError {
        return _mods;
      }
    }
    return _mods;
  }
}
