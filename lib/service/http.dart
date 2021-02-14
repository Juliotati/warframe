import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:warframe/modals/warframe/abilities.dart';
import 'package:warframe/modals/warframe/warframe.dart';
import 'package:warframe/service/codex.dart';

class WarframeData with ChangeNotifier {
  List<Warframe> get warframes => _listOfWarframes;
  List<Warframe> _listOfWarframes = [];

  Warframe byName(String name) {
    return _listOfWarframes.firstWhere((element) => element.name == name);
  }

  bool isDuplicateEntry(String element) {
    return _listOfWarframes.map((e) => e.name).contains(element);
  }

  Future<Warframe> getWarframe(String warframeName) async {
    if (_listOfWarframes.length == CODEX_WARFRAME.length) {
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
        // final List<Abilities> abilities =
        //     await json.decode(data)[0]['abilities'];
        final int stamina = await json.decode(data)[0]['stamina'];
        final String imageName = await json.decode(data)[0]['imageName'];
        final double sprintSpeed = await json.decode(data)[0]['sprintSpeed'];
        final String description = await json.decode(data)[0]['description'];
        final String passiveDescription =
            await json.decode(data)[0]['passiveDescription'];
        if (!isDuplicateEntry(name)) {
          _listOfWarframes.add(
            Warframe(
              name: name,
              imageName: imageName,
              description: description,
              // abilities: abilities,
              health: health,
              armor: armor,
              stamina: stamina,
              power: power,
              sprintSpeed: sprintSpeed,
              passiveDescription: passiveDescription,
            ),
          );
          notifyListeners();
        } else if (isDuplicateEntry(name)) {
          return null;
        }
      } else {
        throw Exception('Failed to load warframes');
      }
    } catch (e) {
      print('UPS => $e');
    }
    return null;
  }

  Future<Warframe> getWarframes() async {
    try {
      final String url = 'https://wf.snekw.com/warframes-wiki/';
      final response = await http.get(url);
      final data = response.body;
      if (response.statusCode == 200) {
        for (final String name in CODEX_WARFRAME) {
          final _wName = name.substring(0, 1).toUpperCase() + name.substring(1);
          final _warframe =
              await json.decode(data)['data']['Warframes']['$_wName'];
          if (!isDuplicateEntry(_warframe['Name'])) {
            _listOfWarframes.add(
              Warframe(
                name: _warframe['Name'],
                health: _warframe['Health'],
                armor: _warframe['Armor'],
                sex: _warframe['Sex'],
                sprint: _warframe['Sprint'],
                shield: _warframe['Shield'],
              ),
            );
            // notifyListeners();
            print(_warframe['Name']);
            print(_listOfWarframes.length);
          } else if (isDuplicateEntry(_warframe['Name'])) {
            return null;
          } else {
            throw Exception('Failed to load warframes');
          }
        }
        notifyListeners();
      }
    } catch (e) {
      print('UPS => $e');
      rethrow;
    }
    return null;
  }
}
