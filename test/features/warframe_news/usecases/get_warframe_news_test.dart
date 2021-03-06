import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:warframe/core/error/failures.dart';
import 'package:warframe/core/usecases/usecases.dart';
import 'package:warframe/features/warframe_news/domain/entities/warframe_news.dart';
import 'package:warframe/features/warframe_news/domain/repositories/warframe_news_repository.dart';
import 'package:warframe/features/warframe_news/domain/usecases/get_warframe_news.dart';

class MockWarframeNewsRepository extends Mock
    implements WarframeNewsRepository {}

void main() {
  late GetWaframeNews useCase;
  late MockWarframeNewsRepository mockWarframeNewsRepository;

  setUp(() {
    mockWarframeNewsRepository = MockWarframeNewsRepository();
    useCase = GetWaframeNews(mockWarframeNewsRepository);
  });

  const WarframeNews tWarframeNews = WarframeNews(
    id: '1',
    message: 'This is a sample news',
    link: 'https://new.com/',
    date: '2021-07-06 23:03:09.344',
    imageLink: 'imageLink',
  );
  const List<WarframeNews> tWarframeNewsList = <WarframeNews>[
    tWarframeNews,
    tWarframeNews,
    tWarframeNews
  ];

  test(
    'get warframe news from the repository',
    () async {
      when(mockWarframeNewsRepository.getNews())
          .thenAnswer((_) async => const Right(tWarframeNewsList));

      final Either<Failure, List<WarframeNews>> result = await useCase(NoParams());

      expect(result, const Right(tWarframeNews));
      verify(mockWarframeNewsRepository.getNews());
      verifyNoMoreInteractions(mockWarframeNewsRepository);
    },
  );
}
