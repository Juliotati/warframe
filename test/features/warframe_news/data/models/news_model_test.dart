import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:warframe/features/warframe_news/data/models/news_model.dart';
import 'package:warframe/features/warframe_news/domain/entities/news.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const NewsModel tNewsModel = NewsModel(
    id: '1',
    message: 'This is a sample news 1',
    link: 'https://new.com/',
    date: '2021-07-06 23:03:09.344',
    imageLink: 'imageLink',
  );

  test(
    'WarframeNewsModel should be a subclass of WarframeNews entity',
    () async {
      expect(tNewsModel, isA<News>());
    },
  );

  group('fromJson', () {
    test(
      'first news in list should match [tNewsModel]',
      () async {
        final List<dynamic> jsonMap =
            await jsonDecode(fixture('news.json')) as List<dynamic>;

        final NewsModel result =
            NewsModel.fromJson(jsonMap.first as Map<String, dynamic>);
        expect(result, equals(tNewsModel));
      },
    );
  });
}
