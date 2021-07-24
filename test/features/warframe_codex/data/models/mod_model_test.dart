import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:warframe/features/warframe_codex/data/models/mod_model.dart';
import 'package:warframe/features/warframe_codex/domain/entities/mod.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const ModModel tModModel = ModModel(
    baseDrain: 4,
    category: 'Mods',
    compatName: 'WARFRAME',
    fusionLimit: 5,
    name: 'Flow',
    polarity: 'Naramon',
    rarity: 'Rare',
    type: 'Warframe Mod',
    uniqueName: '/Lotus/Upgrades/Mods/Warframe/AvatarPowerMaxMod',
    wikiaThumbnail: 'https://static.wikia.nocookie.net/warframe/images/d/d2/FlowModU145.png/revision/latest?cb=20171007150510',
    wikiaUrl: 'http://warframe.fandom.com/wiki/Flow',
  );

  test(
    'ModModel should be a subclass of Mod entity',
    () async {
      expect(tModModel, isA<Mod>());
    },
  );

  group('fromJson', () {
    test(
      'should return a List of mods data in json format',
      () async {
        final List<dynamic> jsonMap = await jsonDecode(fixture('mod.json')) as List<dynamic>;
        final ModModel result = ModModel.fromJson(jsonMap.first as Map<String, dynamic>);
        expect(result, equals(tModModel));
      },
    );
  });
}
