import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:warframe/features/warframe_codex/data/models/warframe_abilities_model.dart';
import 'package:warframe/features/warframe_codex/domain/entities/warframe_abilities.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const AbilitiesModel tAbilitiesModel = AbilitiesModel(
    name: 'Shuriken',
    description: 'Launches a spinning blade of pain, dealing high damage and impaling enemies to walls.',
  );

  test(
    'AbilitiesModel should be a subclass of WarframeNews entity',
    () async {
      expect(tAbilitiesModel, isA<Abilities>());
    },
  );

  group('fromJson', () {
    test(
      'first ability in list should match [$tAbilitiesModel]',
      () async {
        final List<dynamic> jsonMap = await jsonDecode(fixture('abilities.json')) as List<dynamic>;
        final AbilitiesModel result = AbilitiesModel.fromJson(jsonMap.first as Map<String, dynamic>);
        expect(result, equals(tAbilitiesModel));
      },
    );
  });
}
