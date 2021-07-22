import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:warframe/features/warframe_codex/data/models/warframe_model.dart';
import 'package:warframe/features/warframe_codex/data/models/warframe_abilities_model.dart';
import 'package:warframe/features/warframe_codex/domain/entities/warframe.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const WarframeModel tWarframeModel = WarframeModel(
    uniqueName: '/Lotus/Powersuits/Ninja/Ninja',
    name: 'Ash',
    wikiaThumbnail:
        'https://static.wikia.nocookie.net/warframe/images/1/17/AshNewLook.png/revision/latest?cb=20141124022921',
    abilities: <AbilitiesModel>[
      AbilitiesModel(
        name: 'Shuriken',
        description:
            'Launches a spinning blade of pain, dealing high damage and impaling enemies to walls.',
      ),
      AbilitiesModel(
        name: 'Smoke Screen',
        description:
            'Drops a smoke bomb that stuns enemies and obscures their vision, rendering Ash invisible for a short time.',
      ),
      AbilitiesModel(
        name: 'Teleport',
        description:
            'Ash teleports towards the target, bringing him into melee range and making enemies vulnerable to finishers.',
      ),
      AbilitiesModel(
        name: 'Blade Storm',
        description:
            'Project fierce shadow clones of Ash upon groups of distant enemies. Join the fray using Teleport.',
      ),
    ],
    armor: 100,
    description:
        'Ash is great for players looking for a stealthier approach to combat. Lethal abilities are complemented by powers of distraction.',
    health: 150,
    power: 100,
    shield: 100,
    wikiaUrl: 'http://warframe.fandom.com/wiki/Ash',
  );

  test(
    'WarframeModel should be a subclass of WarframeNews entity',
    () async {
      expect(tWarframeModel, isA<Warframe>());
    },
  );

  group('fromJson', () {
    test(
      'first warframe in the List should match',
      () async {
        final List<dynamic> jsonMap =
            await jsonDecode(fixture('warframe.json')) as List<dynamic>;
        final WarframeModel result =
            WarframeModel.fromJson(jsonMap.first as Map<String, dynamic>);
        expect(result, equals(tWarframeModel));
      },
    );
  });
}
