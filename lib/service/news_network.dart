import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:warframe/modals/news.dart';

class NewsNetwork with ChangeNotifier {
  Future<List<WarframeNews>> getWarframeNews() async {

    const String url = 'https://api.warframestat.us/ps4/news/';
    final http.Response response = await http.get(url);
    final List<dynamic> _data = await jsonDecode(response.body);
    final Iterable<WarframeNews> _news =
        _data.map((news) => WarframeNews.fromJson(news)).toList();

    return _news;
  }
}
