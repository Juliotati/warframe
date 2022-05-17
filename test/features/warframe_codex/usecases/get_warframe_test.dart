import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:warframe/core/error/exceptions.dart';
import 'package:warframe/core/usecases/usecases.dart';
import 'package:warframe/features/warframe_codex/data/models/warframe_abilities_model.dart';
import 'package:warframe/features/warframe_codex/data/models/warframe_model.dart';
import 'package:warframe/features/warframe_codex/domain/repositories/warframe_codex_repository.dart';
import 'package:warframe/features/warframe_codex/domain/usecases/get_warframe.dart';

class MockWarframeRepository extends Mock implements WarframeCodexRepository {}

void main() {
  final MockWarframeRepository mockWarframeRepository =
      MockWarframeRepository();
  final GetWarframes useCase = GetWarframes(mockWarframeRepository);

  const WarframeModel tWarframe = WarframeModel(
    uniqueName: '/Lotus/Powersuits/Ninja/Ninja',
    name: 'Ash',
    wikiaThumbnail: '',
    armor: 100,
    description:
        'Ash is great for players looking for a stealthier approach to combat. Lethal abilities are complemented by powers of distraction.',
    category: 'Warframes',
    health: 150,
    power: 100,
    shield: 100,
    wikiaUrl: 'http://warframe.fandom.com/wiki/Ash',
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
  );
  final String tWarframeName = tWarframe.name;

  test(
    'should get a single warframe from the repository by name',
    () async {
      when(() => mockWarframeRepository.warframes()).thenAnswer(
        (_) async => const Right<WarframeException, List<WarframeModel>?>(
          <WarframeModel>[tWarframe],
        ),
      );

      final Future<Either<WarframeException, List<WarframeModel>?>> result =
          useCase(NoParams());

      expect(result, const Right<WarframeException, WarframeModel>(tWarframe));

      verify(() => mockWarframeRepository.warframes());
      verifyNoMoreInteractions(mockWarframeRepository);
    },
  );
}
