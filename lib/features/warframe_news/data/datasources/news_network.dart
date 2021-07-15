import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/warframe_news.dart';

class NewsNetwork with ChangeNotifier {
  Future<List<WarframeNewsModel>> getWarframeNews() async {
    const String url = 'https://api.warframestat.us/ps4/news/';

    final http.Response response = await http.get(Uri.parse(url));

    final List<dynamic> _data = await jsonDecode(response.body) as List<dynamic>;

    final Iterable<WarframeNewsModel> _news = _data.map((dynamic news) {
      return WarframeNewsModel.fromJson(news as Map<String, dynamic>);
    }).toList();

    return _news.toList().reversed.toList();
  }
}
