import 'package:warframe/features/warframe_news/data/models/news.dart';
import 'package:warframe/features/warframe_news/domain/entities/news.dart';

abstract class NewsLocalDatasource {
  /// Get the cached warframe news data from the local storage, previously stored
  /// on last app launch
  Future<List<NewsModel>> getLocalWarframeNews();
  
  Future<void> cacheWarframesNews(List<News> newsList);
}
