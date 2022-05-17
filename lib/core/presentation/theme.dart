part of presentation;

final ThemeData warframeTheme = ThemeData(
  pageTransitionsTheme: PageTransitionsTheme(
    builders: <TargetPlatform, PageTransitionsBuilder>{
      TargetPlatform.android: CustomPageTransitionBuilder(),
      TargetPlatform.windows: CustomPageTransitionBuilder(),
      TargetPlatform.iOS: CustomPageTransitionBuilder(),
    },
  ),
  canvasColor: Colors.transparent,
  appBarTheme: const AppBarTheme(color: Colors.transparent, elevation: 0),
  snackBarTheme: const SnackBarThemeData(
    behavior: SnackBarBehavior.floating,
  ),
  scrollbarTheme: ScrollbarThemeData(
    radius: const Radius.circular(6),
    thumbColor: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
      if (states.contains(MaterialState.hovered)) {
        return const Color.fromRGBO(255, 255, 255, 0.4);
      }
      return const Color.fromRGBO(255, 255, 255, 0.2);
    }),
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: Colors.black,
  ),
);
