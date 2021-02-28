import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:warframe/utilities/placeholders.dart';
import 'package:warframe/utilities/scaffold.dart';


class ActivitiesScreen extends StatelessWidget {
  static const String route = 'activities_screen';

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: WarframeScaffold(
          screenName: 'activities',
          child: WarframeError('Check News or Codex')),
    );
  }
}

