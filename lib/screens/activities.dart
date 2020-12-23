import 'package:flutter/material.dart';
import 'package:warframe/service/http.dart';
import 'package:warframe/utilities/scaffold.dart';

class ActivitiesScreen extends StatefulWidget {
  static const route = 'activities_screen';

  @override
  _ActivitiesScreenState createState() => _ActivitiesScreenState();
}

class _ActivitiesScreenState extends State<ActivitiesScreen> {
  WarframeData warframeData = WarframeData();

  @override
  void initState() {
    warframeData.getWarframeData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WarframeScaffold(
      screenName: 'activities',
      child: ListView(
          children: warframeData.warframes
              .map((e) => DummyWarframe(
                    name: e.name,
                  ))
              .toList()),
    );
  }
}

class DummyWarframe extends StatelessWidget {
  final String name;

  const DummyWarframe({Key key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          name,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
