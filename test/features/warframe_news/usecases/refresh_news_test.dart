import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:warframe/core/error/failures.dart';
import 'package:warframe/core/usecases/usecases.dart';
import 'package:warframe/features/warframe_news/domain/repositories/news_repository.dart';
import 'package:warframe/features/warframe_news/domain/usecases/refresh_news.dart';

class MockNewsRepository extends Mock implements NewsRepository {}

Future<void> main() async {
  final MockNewsRepository mockNewsRepository = MockNewsRepository();
  final RefreshNews useCase = RefreshNews(mockNewsRepository);

  test(
    'should check if refreshNews is called from the repository.',
    () async {
      when(() => mockNewsRepository.refreshNews())
          .thenAnswer((_) async => const Right<Failure, void>(null));

      final Either<Failure, void> result = await useCase(NoParams());

      expect(result.isRight(), true);
      verify(() => mockNewsRepository.refreshNews());
      verifyNoMoreInteractions(mockNewsRepository);
    },
  );
}
