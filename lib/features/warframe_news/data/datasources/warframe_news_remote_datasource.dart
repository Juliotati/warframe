import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:warframe/core/keys/apis.dart';

import '../models/warframe_news.dart';

abstract class WarframeNewsRemoteDatasource {
  Future<void> getRemoteWarframeNews();

  Future<void> refresh();
}

enum NewsState {
  loaded,
  loading,
  empty,
}

class WarframeNewsRemoteDatasourceImpl extends WarframeNewsRemoteDatasource with ChangeNotifier {
  List<WarframeNewsModel>? data;

  NewsState state = NewsState.loading;

  int _retryCount = 0;
  static const int _threshold = 5;

  @override
  Future<void> getRemoteWarframeNews() async {
    final http.Response response = await http.get(Uri.parse(API.newsAPI));
    final List<dynamic> _decodedData = await jsonDecode(response.body) as List<dynamic>;

    if (_decodedData.isEmpty) {
      if (_timedOut()) {
        _endProcessWithEmptyState();
        return;
      }

      state = NewsState.loading;
      _retryCount++;
      getRemoteWarframeNews();
      return;
    }

    final List<WarframeNewsModel> newsList = await _newsList(_decodedData);
    data ??= newsList;

    if (data!.isNotEmpty) {
      await _addNewData(newsList);
    }
    state = NewsState.loaded;
    notifyListeners();
  }

  bool _timedOut() {
    return _retryCount >= _threshold;
  }

  void _endProcessWithEmptyState(){
    state = NewsState.empty;
    notifyListeners();
  }

  Future<List<WarframeNewsModel>> _newsList(List<dynamic> data) async {
    return data.map((dynamic news) {
      return WarframeNewsModel.fromJson(news as Map<String, dynamic>);
    }).toList().reversed.toList();
  }

  Future<void> _addNewData(List<WarframeNewsModel> newsList) async {
     for (final WarframeNewsModel news in newsList) {
      if (!_itemExist(news)) data!.insert(0, news);
    }
  }

  bool _itemExist(WarframeNewsModel news) {
    try {
      final WarframeNewsModel existingNews =
          data!.firstWhere((WarframeNewsModel element) {
        return element.id == news.id;
      });
      if (existingNews.id == news.id) return true;
      return false;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<void> refresh() async {
    state = NewsState.loading;
    _retryCount = 0;
    notifyListeners();
    await getRemoteWarframeNews();
  }
}
