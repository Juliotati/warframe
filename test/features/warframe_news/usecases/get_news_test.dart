import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:warframe/core/error/exceptions.dart';
import 'package:warframe/core/error/failures.dart';
import 'package:warframe/core/usecases/usecases.dart';
import 'package:warframe/features/warframe_news/data/models/news.dart';
import 'package:warframe/features/warframe_news/domain/repositories/news_repository.dart';
import 'package:warframe/features/warframe_news/domain/usecases/get_news.dart';

class MockNewsRepository extends Mock implements NewsRepository {}

Future<void> main() async {
  final MockNewsRepository mockNewsRepository = MockNewsRepository();
  final GetNews useCase = GetNews(mockNewsRepository);

  test(
    'verify if getNews is actually called from the repository',
    () async {
      when(() => mockNewsRepository.getNews()).thenAnswer((_) async {
        return const Right<WarframeException, List<NewsModel>>(<NewsModel>[]);
      });

      final Either<WarframeException, void> result = await useCase(NoParams());

      expect(result.isRight(), true);
      verify(() => mockNewsRepository.getNews());
      verifyNoMoreInteractions(mockNewsRepository);
    },
  );
}
