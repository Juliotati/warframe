import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/presentation/wrapper.dart';
import 'export/warframe_ui.dart';
import 'features/warframe_codex/data/datasources/warframe_network.dart';
import 'features/warframe_codex/data/datasources/weapon_network.dart';
import 'features/warframe_codex/presentation/screens/codex_categories.dart';
import 'features/warframe_codex/presentation/screens/codex_category_data.dart';
import 'features/warframe_news/data/datasources/warframe_news_remote_datasource.dart';
import 'features/warframe_news/presentation/screens/news.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <ListenableProvider<dynamic>>[
        ListenableProvider<WarframeNetwork>(create: (_) => WarframeNetwork()),
        ListenableProvider<LayoutHelper>(create: (_) => LayoutHelper()),
        ListenableProvider<NewsNetwork>(create: (_) => NewsNetwork()),
        ListenableProvider<WeaponNetwork>(create: (_) => WeaponNetwork()),
      ],
      child: const _App(),
    );
  }
}

class _App extends StatelessWidget {
  const _App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<WarframeNetwork>().getAllWarframes();
    context.read<WeaponNetwork>().getWeapons();
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
