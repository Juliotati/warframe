library providers;

import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:warframe/core/helpers/screen_delegate.dart';
import 'package:warframe/core/platform/network_info.dart';
import 'package:warframe/features/warframe_codex/data/datasources/mods_remote_datasource.dart';
import 'package:warframe/features/warframe_codex/data/datasources/warframe_remote_datasource.dart';
import 'package:warframe/features/warframe_codex/data/datasources/weapon_remote_datasource.dart';
import 'package:warframe/features/warframe_codex/data/repositories/warframe_codex_repository_impl.dart';
import 'package:warframe/features/warframe_codex/domain/usecases/get_mods.dart';
import 'package:warframe/features/warframe_codex/domain/usecases/get_warframe.dart';
import 'package:warframe/features/warframe_codex/domain/usecases/get_weapons.dart';
import 'package:warframe/features/warframe_codex/presentation/provider/warframe_codex_provider.dart';
import 'package:warframe/features/warframe_news/data/datasources/news_remote_datasource.dart';
import 'package:warframe/features/warframe_news/data/repositories/news_repository_impl.dart';
import 'package:warframe/features/warframe_news/domain/usecases/get_news.dart';
import 'package:warframe/features/warframe_news/presentation/provider/news_provider.dart';

part 'core.dart';
part 'news.dart';
part 'provider_state.dart';
part 'warframe_codex.dart';

List<SingleChildWidget> get warframeProviders {
  return <SingleChildWidget>[
    ..._coreProviders,
    ..._newsProviders,
    ..._warframeCodexProviders,
  ];
}
