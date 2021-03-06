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
  appBarTheme: const AppBarTheme(color: Colors.transparent, elevation: 0),
);
