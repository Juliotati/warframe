import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:warframe/core/data/warframe.dart';
import 'package:warframe/core/helpers/screen_delegate.dart';
import 'package:warframe/core/presentation/presentation.dart';
import 'package:warframe/features/warframe_codex/data/datasources/mods_remote_datasource.dart';
import 'package:warframe/features/warframe_news/presentation/provider/news_provider.dart';

import 'core/presentation/screens/wrapper.dart';
import 'features/warframe_codex/data/datasources/warframe_remote_datasource.dart';
import 'features/warframe_codex/data/datasources/weapon_remote_datasource.dart';
import 'features/warframe_codex/warframe_codex.dart';
import 'features/warframe_news/data/datasources/news_remote_datasource.dart';
import 'features/warframe_news/warframe_news.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <SingleChildWidget>[
        ListenableProvider<ScreenDelegate>(create: (_) => ScreenDelegate()),
        Provider<WarframeApp>(
          create: (_) => WarframeApp.instance,
        ),
        Provider<NewsRemoteDatasourceImpl>(
          create: (_) => NewsRemoteDatasourceImpl(),
        ),
        ListenableProxyProvider<NewsRemoteDatasourceImpl, NewsProvider>(
          update: (_, NewsRemoteDatasourceImpl remoteSource, __) {
            return NewsProvider(remoteSource);
          },
        ),
        ListenableProvider<WarframeRemoteDatasourceImpl>(
          create: (_) => WarframeRemoteDatasourceImpl(),
        ),
        ListenableProvider<ModsNetwork>(create: (_) => ModsNetwork()),
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
  Future<void> _init() async {
    await WarframeApp.instance.initialize(context);
  }

  @override
  void initState() {
    _init();
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
