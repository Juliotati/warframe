import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warframe/export/warframe_ui.dart';
import 'package:warframe/service/news_network.dart';
import 'package:warframe/service/warframe_network.dart';
import 'package:warframe/service/weapon_network.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <ListenableProvider<dynamic>>[
        ListenableProvider<WarframeNetwork>(create: (_) => WarframeNetwork()),
        ListenableProvider<NewsNetwork>(create: (_) => NewsNetwork()),
        ListenableProvider<WeaponNetwork>(create: (_) => WeaponNetwork()),
      ],
      child: const _App(),
    );
  }
}

class _App extends StatelessWidget {
  const _App({
    Key key,
  }) : super(key: key);

  Future<void> getDataFromAPI(BuildContext context) async {
    await Provider.of<WarframeNetwork>(context, listen: false)
        .getAllWarframes();
    await Provider.of<WeaponNetwork>(context, listen: false).getWeapons();
  }

  @override
  Widget build(BuildContext context) {
    getDataFromAPI(context);
    return MaterialApp(
      title: 'Warframe',
      theme: warframeTheme,
      debugShowCheckedModeBanner: false,
      home: const NewsScreen(),
      routes: <String, Widget Function(BuildContext)>{
        NewsScreen.route: (_) => const NewsScreen(),
        LogIn.route: (_) => const LogIn(),
        CodexCategoryData.route: (_) => const CodexCategoryData(),
        WarframeProfile.route: (_) => const WarframeProfile(),
        CodexCategories.route: (_) => const CodexCategories(),
      },
    );
  }
}
