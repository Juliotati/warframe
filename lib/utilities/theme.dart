import 'package:flutter/material.dart';
import 'package:warframe/utilities/page_transition.dart';

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
  appBarTheme: AppBarTheme(color: Colors.transparent, elevation: 0),
);
