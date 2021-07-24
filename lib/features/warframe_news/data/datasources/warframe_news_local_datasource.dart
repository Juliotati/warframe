
import 'package:warframe/features/warframe_news/data/models/warframe_news.dart';

abstract class WarframeNewsLocalDatasource {
  /// Get warframe news data from the local storage
  Future<List<WarframeNewsModel>> getLocalWarframeNews();
}
