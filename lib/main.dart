import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:warframe/screens/activities.dart';
import 'package:warframe/screens/codex/codex.dart';
import 'package:warframe/screens/codex/codex_widgets/codex_grid.dart';
import 'package:warframe/screens/codex/warframes/warframe_profile.dart';
import 'package:warframe/screens/login/login.dart';
import 'package:warframe/screens/news/news.dart';
import 'package:warframe/service/http.dart';
import 'package:warframe/service/news.dart';
import 'package:warframe/utilities/drawer/drawer_data.dart';
import 'package:warframe/utilities/theme.dart';

void main() {
  runApp(MyApp());
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
        ListenableProvider<WarframeData>(create: (_) => WarframeData()),
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
          CodexGrid.route: (context) => CodexGrid(),
          NewsScreen.route: (context) => NewsScreen(),
          WarframeProfile.route: (context) => WarframeProfile(),
          CodexScreen.route: (context) => CodexScreen(),
        },
      ),
    );
  }
}
