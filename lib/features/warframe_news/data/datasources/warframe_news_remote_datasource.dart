import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:warframe/core/presentation/apis.dart';

import '../models/warframe_news.dart';

abstract class WarframeNewsRemoteDatasource {
  /// Calls the official warframe news API endPoint
  Future<List<WarframeNewsModel>> getRemoteWarframeNews();
}

class NewsNetwork extends WarframeNewsRemoteDatasource with ChangeNotifier {
  @override
  Future<List<WarframeNewsModel>> getRemoteWarframeNews() async {
    final http.Response response = await http.get(Uri.parse(API.newsAPI));

    final List<dynamic> _data = await jsonDecode(response.body) as List<dynamic>;

    final Iterable<WarframeNewsModel> _news = _data.map((dynamic news) {
      return WarframeNewsModel.fromJson(news as Map<String, dynamic>);
    }).toList();

    return _news.toList().reversed.toList();
  }
}
