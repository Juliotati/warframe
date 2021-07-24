import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:warframe/features/warframe_news/data/models/warframe_news.dart';
import 'package:warframe/features/warframe_news/domain/entities/warframe_news.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const WarframeNewsModel tNewsModel = WarframeNewsModel(
    id: '1',
    message: 'This is a sample news 1',
    link: 'https://new.com/',
    date: '2021-07-06 23:03:09.344',
    imageLink: 'imageLink',
  );

  test(
    'WarframeNewsModel should be a subclass of WarframeNews entity',
    () async {
      expect(tNewsModel, isA<WarframeNews>());
    },
  );

  group('fromJson', () {
    test(
      'first news in list should match [$tNewsModel]',
      () async {
        final List<dynamic> jsonMap =
            await jsonDecode(fixture('news.json')) as List<dynamic>;
        final WarframeNewsModel result = WarframeNewsModel.fromJson(jsonMap.first as Map<String, dynamic>);
        expect(result, equals(tNewsModel));
      },
    );
  });
}
