import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:warframe/modals/abilities.dart';
import 'package:warframe/modals/warframe.dart';

class WarframeNetwork with ChangeNotifier {
  /// API for getting  a single warframe, be prime or a normal one
  Future<Warframe> getWarframe(String warframeName, int type) async {
    final String url =
        'https://api.warframestat.us/warframes/search/$warframeName';
    final http.Response response = await http.get(url);
    final dynamic _data = await json.decode(response.body)[type];
    final Warframe warframe = Warframe(
      name: _data['name'],
      description: _data['description'],
      health: _data['health'],
      shield: _data['shield'],
      power: _data['power'],
      armor: _data['armor'],
      wikiaThumbnail: _data['wikiaThumbnail'],
      wikiaUrl: _data['wikiaUrl'],
      sprintSpeed: _data['sprintSpeed'],
      passiveDescription: _data['passiveDescription'],
      abilities: (_data['abilities'] as List)
          .map((ability) => Abilities(
                name: ability['name'],
                description: ability['description'],
              ))
          .toList(),
    );
    return warframe;
  }

  /// [Warframe official API] Gets  all warframes, be prime or a normal one
  Future<List<Warframe>> getAllWarframes() async {
    const String url = 'https://api.warframestat.us/warframes/';
    final http.Response response = await http.get(url);
    final List<dynamic> _data = await json.decode(response.body);

    final Iterable<Warframe> _warframes =
        _data.map((warframe) => Warframe.fromJson(warframe)).toList();

    return _warframes;
  }

  /// [Warframe Random API] Gets all warframes
  Future<List<Warframe>> getWarframes() async {
    final List<Warframe> _warframes = <Warframe>[];

    const String url = 'https://wf.snekw.com/warframes-wiki/';

    final http.Response response = await http.get(url);

    final dynamic _data = await jsonDecode(response.body)['data']['Warframes'];

    try {
      _data?.forEach((String key, dynamic _value) {
        _warframes.add(
          Warframe(
            name: _value['Name'],
            health: _value['Health'],
            armor: _value['Armor'],
            sex: _value['Sex'],
            shield: _value['Shield'],
          ),
        );
      });
    } catch (e) {
      throw Exception('Failed to load warframes');
    }

    return _warframes;
  }
}

