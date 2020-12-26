import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:warframe/modals/warframe.dart';
import 'package:warframe/service/codex.dart';

class WarframeData with ChangeNotifier {
  List<Warframe> warframes = [];

  Warframe byName(String name) {
    return warframes.firstWhere((element) => element.name == name);
  }

  bool exists(String element) {
    return warframes.map((e) => e.name).contains(element);
  }

  Future<Warframe> getWarframes(String warframeName) async {
    if (warframes.length == CODEX_WARFRAME.length) {
      return null;
    }
    try {
      final String url =
          'https://api.warframestat.us/warframes/search/$warframeName';
      // final String url = 'https://wf.snekw.com/warframes-wiki/';
      final response = await http.get(url);
      final data = response.body;
      if (response.statusCode == 200) {
        final int power = await json.decode(data)[0]['power'];
        final int armor = await json.decode(data)[0]['armor'];
        final String name = await json.decode(data)[0]['name'];
        final int health = await json.decode(data)[0]['health'];
        final int stamina = await json.decode(data)[0]['stamina'];
        final String imageName = await json.decode(data)[0]['imageName'];
        final int sprintSpeed = await json.decode(data)[0]['sprintSpeed'];
        final String description = await json.decode(data)[0]['description'];
        final String passiveDescription =
            await json.decode(data)[0]['passiveDescription'];
        if (!exists(name)) {
          warframes.add(
            Warframe(
              name: name,
              imageName: imageName,
              description: description,
              health: health,
              armor: armor,
              stamina: stamina,
              power: power,
              sprintSpeed: sprintSpeed,
              passiveDescription: passiveDescription,
            ),
          );
          notifyListeners();
        } else if (exists(name)) {
          return null;
        }
      } else {
        throw Exception('Failed to load warframes');
      }
    } catch (e) {}
    return null;
  }
}
