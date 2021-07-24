import 'dart:convert';

import 'package:warframe/core/presentation/apis.dart';
import 'package:warframe/export/warframe_ui.dart';
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

    List<dynamic>? decodedMods = await jsonDecode(response.body) as List<dynamic>;

    if (_mods.isNotEmpty) {
      decodedMods = null;
      return;
    }

    final Iterable<ModModel> parsedMods = decodedMods.map((dynamic mod) {
      return ModModel.fromJson(mod as Map<String, dynamic>);
    });

    if (_mods.isEmpty) _mods.addAll(parsedMods);
  }
}
