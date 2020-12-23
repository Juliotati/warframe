import 'package:flutter/material.dart';
import 'package:warframe/utilities/scaffold.dart';
import 'package:warframe/widgets/warframe_drawer.dart';

class ActivitiesScreen extends StatelessWidget {
  static const route = 'activities_screen';

  @override
  Widget build(BuildContext context) {
    return WarframeScaffold(
      screenName: 'activities',
      child: Text(
        'Activity',
        style: TextStyle(color: Colors.white, fontSize: 32),
      ),
    );
  }
}
