import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:warframe/modals/warframe.dart';

List<String> wrNames = [
  'Ash',
  'Atlas',
  'Banshee',
  'Baruuk',
  'Chroma',
  'Ember',
  'Equinox',
  'Excalibur',
  'Frost',
  'Gara',
  'Garuda',
  'Gauss',
  'Grendel',
  'Harrow',
  'Hildryn',
  'Hydroid',
  'Inaros',
  'Ivara',
  'Khora',
  'Lavos',
  'Limbo',
  'Loki',
  'Mag',
  'Mesa',
  'Mirage',
  'Nekros',
  'Nezha',
  'Nidus',
  'Nova',
  'Nyx',
  'Oberon',
  'Octavia',
  'Protea',
  'Revenant',
  'Rhino',
  'Saryn',
  'Titania',
  'Trinity',
  'Valkyr',
  'Vauban',
  'Volt',
  'Wisp',
  'Wukong',
  'Xaku',
  'Zephyr',
];

class WarframeData {
  List<Warframe> warframes = [
    Warframe(name: 'Dummy frame'),
  ];

  Future<void> getWarframeData() async {
    for (String name in wrNames) {
      final String url = 'https://api.warframestat.us/warframes/search/$name';
      try {
        final response = await http.get(url);
        final data = await json.decode(response.body) as Map<String, dynamic>;
        if (data == null) {
          return;
        }
        data.forEach((_, wrData) {
          warframes.add(Warframe(
            uniqueName: wrData['uniqueName'],
            name: wrData['name'],
            armor: wrData['armor'],
            health: wrData['health'],
            shield: wrData['shield'],
            sprint: wrData['sprint'],
            imageName: wrData['imageName'],
            abilities: wrData['abilities'] as List<Abilities>,
            description: wrData['description'],
            sprintSpeed: wrData['sprintSpeed'],
            wikiaThumbnail: wrData['wikiaThumbnail'],
            passiveDescription: wrData['passiveDescription'],
          ));
        });
      } catch (e) {
        rethrow;
      }
    }
  }
}
