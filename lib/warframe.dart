import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warframe/core/helpers/layout_helper.dart';
import 'package:warframe/core/presentation/presentation.dart';
import 'package:warframe/features/warframe_codex/data/datasources/mods_remote_datasource.dart';

import 'core/presentation/wrapper.dart';
import 'features/warframe_codex/data/datasources/warframe_remote_datasource.dart';
import 'features/warframe_codex/data/datasources/weapon_remote_datasource.dart';
import 'features/warframe_codex/warframe_codex.dart';
import 'features/warframe_news/data/datasources/warframe_news_remote_datasource.dart';
import 'features/warframe_news/warframe_news.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <ListenableProvider<dynamic>>[
        ListenableProvider<WarframeNetwork>(create: (_) => WarframeNetwork()),
        ListenableProvider<ModsNetwork>(create: (_) => ModsNetwork()),
        ListenableProvider<LayoutHelper>(create: (_) => LayoutHelper()),
        ListenableProvider<WarframeNewsRemoteDatasourceImpl>(
          create: (_) => WarframeNewsRemoteDatasourceImpl(),
        ),
        ListenableProvider<WeaponNetwork>(create: (_) => WeaponNetwork()),
      ],
      child: const _App(),
    );
  }
}

class _App extends StatefulWidget {
  const _App({
    Key? key,
  }) : super(key: key);

  @override
  __AppState createState() => __AppState();
}

class __AppState extends State<_App> {
  Future<void> loadGameData(BuildContext context) async {
    await context.read<WarframeNewsRemoteDatasourceImpl>().getRemoteWarframeNews();
    await context.read<WarframeNetwork>().getRemoteWarframes();
    await context.read<ModsNetwork>().getRemoteMods();
    await context.read<WeaponNetwork>().getRemoteWeapons();
  }

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) => loadGameData(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Warframe',
      theme: warframeTheme,
      debugShowCheckedModeBanner: false,
      home: const WarframeWrapper(),
      routes: <String, Widget Function(BuildContext)>{
        WarframeWrapper.route: (_) => const WarframeWrapper(),
        NewsScreen.route: (_) => const NewsScreen(),
        WarframeProfile.route: (_) => const WarframeProfile(),
        CodexCategories.route: (_) => const CodexCategories(),
        CodexCategoryData.route: (_) => const CodexCategoryData(),
      },
    );
  }
}
