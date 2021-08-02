import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:warframe/core/error/failures.dart';
import 'package:warframe/core/usecases/usecases.dart';
import 'package:warframe/features/warframe_news/domain/entities/warframe_news.dart';
import 'package:warframe/features/warframe_news/domain/repositories/warframe_news_repository.dart';
import 'package:warframe/features/warframe_news/domain/usecases/get_warframe_news.dart';

class MockWarframeNewsRepository extends Mock
    implements WarframeNewsRepository {}

Future<void> main() async {
  final MockWarframeNewsRepository mockWarframeNewsRepository = MockWarframeNewsRepository();
  final GetWarframeNews useCase = GetWarframeNews(mockWarframeNewsRepository);
 
  test(
    'should return a list of warframe news from the repository',
    () async {
      when(() => mockWarframeNewsRepository.getWarframeNews())
          .thenAnswer((_) async => const Right(<WarframeNews>[]));

      final Either<Failure, List<WarframeNews>> result =
          await useCase(NoParams());

      expect(result.isRight(), true);
      verify(() => mockWarframeNewsRepository.getWarframeNews());
      verifyNoMoreInteractions(mockWarframeNewsRepository);
    },
  );
}
