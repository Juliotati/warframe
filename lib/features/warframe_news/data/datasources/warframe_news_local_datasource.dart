import 'package:warframe/features/warframe_news/data/models/warframe_news.dart';
import 'package:warframe/features/warframe_news/domain/entities/warframe_news.dart';

abstract class WarframeNewsLocalDatasource {
  /// Get the cached warframe news data from the local storage, previously stored
  /// on last app launch
  Future<List<WarframeNewsModel>> getLocalWarframeNews();
  
  Future<void> cacheWarframesNews(List<WarframeNews> newsList);
}
