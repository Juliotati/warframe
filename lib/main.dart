import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:warframe/screens/activities.dart';
import 'package:warframe/screens/codex/codex.dart';
import 'package:warframe/screens/codex/codex_widgets/codex_grid.dart';
import 'package:warframe/screens/codex/warframes/warframe_profile.dart';
import 'package:warframe/screens/login/login.dart';
import 'package:warframe/screens/news/news.dart';
import 'package:warframe/service/news_http.dart';
import 'package:warframe/service/warframe_http.dart';
import 'package:warframe/utilities/drawer/drawer_data.dart';
import 'package:warframe/utilities/theme.dart';

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
