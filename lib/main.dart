import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:warframe/export/warframe_ui.dart';
import 'package:warframe/service/news_network.dart';
import 'package:warframe/service/warframe_network.dart';
import 'package:warframe/service/weapon_network.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <ListenableProvider<dynamic>>[
        ListenableProvider<WarframeNetwork>(create: (_) => WarframeNetwork()),
        ListenableProvider<NewsNetwork>(create: (_) => NewsNetwork()),
        ListenableProvider<WeaponNetwork>(create: (_) => WeaponNetwork()),
        ListenableProvider<DrawerProvider>(
            create: (BuildContext context) => DrawerProvider()),
      ],
      child: MaterialApp(
        title: 'Warframe',
        theme: warframeTheme,
        debugShowCheckedModeBanner: false,
        home: LogIn(),
        routes: <String, Widget Function(BuildContext)>{
          LogIn.route: (BuildContext context) => LogIn(),
          ActivitiesScreen.route: (BuildContext context) => ActivitiesScreen(),
          CodexGrid.route: (BuildContext context) => CodexGrid(),
          NewsScreen.route: (BuildContext context) => NewsScreen(),
          WarframeProfile.route: (BuildContext context) => WarframeProfile(),
          CodexScreen.route: (BuildContext context) => CodexScreen(),
        },
      ),
    );
  }
}
