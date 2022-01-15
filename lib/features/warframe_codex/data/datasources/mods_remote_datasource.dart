import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:warframe/core/keys/apis.dart';
import 'package:warframe/core/platform/network_info.dart';
import 'package:warframe/features/warframe_codex/data/models/mod_model.dart';

abstract class ModsRemoteDatasource {
  /// Gets all Prime and non-prime mods from the official warframe API on app launch
  /// Rethrows an [Error] if something goes wrong
  Future<void> getRemoteMods();
}

class ModsRemoteDatasourceImpl extends ModsRemoteDatasource
    with ChangeNotifier {
  List<ModModel> get mods => _mods;

  final List<ModModel> _mods = <ModModel>[];

  @override
  Future<void> getRemoteMods() async {
    final bool isConnected = await NetWorkInfoImpl.instance.isConnected;

    if (!isConnected) return;

    final http.Response response = await http.get(Uri.parse(API.modsAPI));

    if (response.statusCode != 200) return;

    List<dynamic>? decodedMods =
        await jsonDecode(response.body) as List<dynamic>;

    if (_mods.isNotEmpty) {
      decodedMods = null;
      return;
    }
    await _addNonDuplicateMods(decodedMods);
  }

  Future<void> _addNonDuplicateMods(List<dynamic> decodedMods) async {
    for (int i = 0; i < decodedMods.length; i++) {
      final Map<String, dynamic> _mod = decodedMods[i] as Map<String, dynamic>;
      try {
        final int _nextMod = i + 1;

        // ignore: avoid_dynamic_calls
        if (_mod['name'] != decodedMods[_nextMod]['name']) {
          _mods.add(ModModel.fromJson(_mod));
        }

        // ignore: avoid_catching_errors
      } on RangeError {
        return;
      }
      notifyListeners();
    }
  }
}
