import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:warframe/app_data/codex.dart';
import 'package:warframe/app_data/news.dart';
import 'package:warframe/modals/drawer_items.dart';
import 'package:warframe/screens/activities.dart';
import 'package:warframe/screens/codex/codex.dart';
import 'package:warframe/screens/codex/warfames/warframe_profile.dart';
import 'package:warframe/screens/login.dart';
import 'package:warframe/screens/news/news.dart';
import 'package:warframe/utilities/theme.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setEnabledSystemUIOverlays([]);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider<CodexWarframes>(create: (_) => CodexWarframes()),
        ListenableProvider<DrawerProvider>(create: (context) => DrawerProvider()),
        ListenableProvider<News>(create: (_) => News())
      ],
      child: MaterialApp(
        title: 'Warframe',
        theme: warframeTheme,
        debugShowCheckedModeBanner: false,
        home: LogIn(),
        routes: {
          LogIn.route: (context) => LogIn(),
          ActivitiesScreen.route: (context) => ActivitiesScreen(),
          NewsScreen.route: (context) => NewsScreen(),
          WarframeProfile.route: (context) => WarframeProfile(),
          CodexScreen.route: (context) => CodexScreen(),
        },
      ),
    );
  }
}
