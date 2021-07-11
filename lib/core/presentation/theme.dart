part of presentation;

final ThemeData warframeTheme = ThemeData(
  pageTransitionsTheme: PageTransitionsTheme(
    builders: <TargetPlatform, PageTransitionsBuilder>{
      TargetPlatform.android: CustomPageTransitionBuilder(),
      TargetPlatform.iOS: CustomPageTransitionBuilder(),
    },
  ),
  brightness: Brightness.dark,
  accentColor: Colors.black,
  canvasColor: Colors.transparent,
  // scaffoldBackgroundColor: const Color.fromRGBO(255, 255, 255, 0.9),
  appBarTheme: const AppBarTheme(color: Colors.transparent, elevation: 0),
);
