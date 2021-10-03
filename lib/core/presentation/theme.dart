part of presentation;

final ThemeData warframeTheme = ThemeData(
  pageTransitionsTheme: PageTransitionsTheme(
    builders: <TargetPlatform, PageTransitionsBuilder>{
      TargetPlatform.android: CustomPageTransitionBuilder(),
      TargetPlatform.windows: CustomPageTransitionBuilder(),
      TargetPlatform.iOS: CustomPageTransitionBuilder(),
    },
  ),
  brightness: getBrightness(),
  canvasColor: Colors.transparent,
  appBarTheme: const AppBarTheme(color: Colors.transparent, elevation: 0),
  snackBarTheme: const SnackBarThemeData(
    behavior: SnackBarBehavior.floating,
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: Colors.black,
  ),
);

Brightness? getBrightness(){
  if(kIsWeb) return null;
  if(Platform.isWindows) return null;
  return Brightness.dark;
}