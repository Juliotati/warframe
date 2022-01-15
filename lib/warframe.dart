import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warframe/core/config/providers/providers.dart';
import 'package:warframe/core/presentation/presentation.dart';
import 'package:warframe/core/presentation/screens/wrapper.dart';
import 'package:warframe/features/warframe_codex/presentation/provider/warframe_codex_provider.dart';
import 'package:warframe/features/warframe_codex/warframe_codex.dart';
import 'package:warframe/features/warframe_news/presentation/provider/news_provider.dart';
import 'package:warframe/features/warframe_news/warframe_news.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: warframeProviders,
      child: const _App(),
    );
  }
}

class _App extends StatefulWidget {
  const _App({
    Key? key,
  }) : super(key: key);

  @override
  State<_App> createState() => _AppState();
}

class _AppState extends State<_App> {
  Future<void> _loadAppData() async {
    await context.read<NewsProvider>().getNews().whenComplete(() async {
      context.read<WarframeCodexProvider>()
        ..getWarframes()
        ..getWeapons()
        ..getMods();
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _loadAppData();
    });
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
