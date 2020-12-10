import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import './app_data/codex.dart';
import './screens/codex_warframes.dart';
import './screens/codex_warframe.dart';
import './screens/activities.dart';
import './screens/news.dart';
import './screens/login.dart';
import './app_data/news.dart';

void main() {
  runApp(MyApp());
  // this allows the app to hide the software buttons and the status bar
  SystemChrome.setEnabledSystemUIOverlays([]);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

// App's Root/Main Widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GoogleFonts.robotoTextTheme(TextTheme());
    return MultiProvider(
      providers: [
        ListenableProvider<CodexWarframes>(create: (_) => CodexWarframes()),
//        ListenableProvider<NewsCard>(create: (context) =>NewsCard()),
        ListenableProvider<News>(create: (_) => News())
      ],
      child: MaterialApp(
        title: 'Warframe',
        theme: ThemeData(
          // using google fonts in the app
          textTheme: TextTheme(
            headline3: GoogleFonts.roboto(fontSize: 24, color: Colors.black),
            headline4: GoogleFonts.roboto(fontSize: 24, color: Colors.grey),
            headline5: GoogleFonts.roboto(fontSize: 18, color: Colors.white),
            bodyText1: GoogleFonts.roboto(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
            bodyText2: GoogleFonts.roboto(fontSize: 16, color: Colors.white),
            subtitle1: GoogleFonts.roboto(
                fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          accentColor: Colors.black,
          canvasColor: Colors.transparent,
          appBarTheme: AppBarTheme(color: Colors.transparent),
        ),
        debugShowCheckedModeBanner: false,
        home: LogIn(),
        routes: {
          LogIn.route: (context) => LogIn(),
          ActivitiesScreen.route: (context) => ActivitiesScreen(),
          NewsScreen.route: (context) => NewsScreen(),
          CodexWarframe.route: (context) => CodexWarframe(),
          CodexWarframesScreen.route: (context) => CodexWarframesScreen(),
        },
      ),
    );
  }
}
