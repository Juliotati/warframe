part of presentation;

final ThemeData warframeTheme = ThemeData(
  pageTransitionsTheme: PageTransitionsTheme(
    builders: <TargetPlatform, PageTransitionsBuilder>{
      TargetPlatform.android: CustomPageTransitionBuilder(),
      TargetPlatform.windows: CustomPageTransitionBuilder(),
      TargetPlatform.iOS: CustomPageTransitionBuilder(),
    },
  ),
  brightness:  Platform.isWindows ? null : Brightness.dark,
  canvasColor: Colors.transparent,
  appBarTheme: const AppBarTheme(color: Colors.transparent, elevation: 0),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: Colors.black,
  ),
);
