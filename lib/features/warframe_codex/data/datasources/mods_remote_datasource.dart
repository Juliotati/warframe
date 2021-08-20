import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:warframe/core/keys/apis.dart';
import 'package:warframe/features/warframe_codex/data/models/mod_model.dart';
import 'package:http/http.dart' as http;

abstract class ModsRemoteDatasource {
  /// Gets all Prime and non-prime mods from the official warframe API on app launch
  /// Rethrows an [Error] if something goes wrong
  Future<void> getRemoteMods();
}

class ModsNetwork extends ModsRemoteDatasource with ChangeNotifier {
  List<ModModel> get data => _mods;

  final List<ModModel> _mods = <ModModel>[];

  @override
  Future<void> getRemoteMods() async {
    final http.Response response = await http.get(Uri.parse(API.modsAPI));

    if (response.statusCode != 200) return;

    List<dynamic>? decodedMods =
        await jsonDecode(response.body) as List<dynamic>;

    if (_mods.isNotEmpty) {
      decodedMods = null;
      return;
    }

    for (int i = 0; i < decodedMods.length; i++) {
      final Map<String, dynamic> _jsonMap =
          decodedMods[i] as Map<String, dynamic>;
      try {
        if (_jsonMap['name'] != decodedMods[i + 1]['name']) {
          _mods.add(ModModel.fromJson(_jsonMap));
        }
        // ignore: avoid_catching_errors
      } on RangeError {
        return;
      }
      notifyListeners();
    }
  }
}
