library providers;

import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:warframe/core/helpers/screen_delegate.dart';
import 'package:warframe/core/platform/network_info.dart';
import 'package:warframe/features/warframe_news/data/datasources/news_remote_datasource.dart';
import 'package:warframe/features/warframe_news/data/repositories/news_repository_impl.dart';
import 'package:warframe/features/warframe_news/domain/repositories/news_repository.dart';
import 'package:warframe/features/warframe_news/domain/usecases/get_news.dart';
import 'package:warframe/features/warframe_news/domain/usecases/refresh_news.dart';
import 'package:warframe/features/warframe_news/presentation/provider/news_provider.dart';

part 'core.dart';
part 'news.dart';

List<SingleChildWidget> get warframeProviders {
  return <SingleChildWidget>[
    ..._coreProviders,
    ..._newsProviders,
  ];
}
