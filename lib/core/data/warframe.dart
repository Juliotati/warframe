import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:warframe/features/warframe_codex/data/datasources/mods_remote_datasource.dart';
import 'package:warframe/features/warframe_codex/data/datasources/warframe_remote_datasource.dart';
import 'package:warframe/features/warframe_codex/data/datasources/weapon_remote_datasource.dart';
import 'package:warframe/features/warframe_news/data/datasources/news_remote_datasource.dart';

class WarframeApp {
  const WarframeApp._();

  static const WarframeApp instance = WarframeApp._();

  Future<void> initialize(BuildContext context) async {
    await context.read<NewsRemoteDatasourceImpl>().getRemoteNews();
    await context.read<WarframeRemoteDatasourceImpl>().getRemoteWarframes();
    await context.read<ModsNetwork>().getRemoteMods();
    await context.read<WeaponNetwork>().getRemoteWeapons();
  }
}
