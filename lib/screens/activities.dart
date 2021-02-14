import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:warframe/modals/warframe/warframe.dart';
import 'package:warframe/service/codex.dart';
import 'package:warframe/service/http.dart';
import 'package:warframe/utilities/scaffold.dart';

class ActivitiesScreen extends StatefulWidget {
  static const route = 'activities_screen';

  @override
  _ActivitiesScreenState createState() => _ActivitiesScreenState();
}

class _ActivitiesScreenState extends State<ActivitiesScreen> {
  String randomWarframe() {
    final rand = Random();
    final index = rand.nextInt(CODEX_WARFRAME.length);
    print(CODEX_WARFRAME[index]);
    return CODEX_WARFRAME[index];
  }

  @override
  Widget build(BuildContext context) {
    Future<void> _refresh() async {
      await Provider.of<WarframeData>(context, listen: false)
          .getWarframes(randomWarframe());
      setState(() {});
      return null;
    }

    final _warframe =
        Provider.of<WarframeData>(context, listen: false).warframes;
    final _data = Provider.of<WarframeData>(context, listen: false);
    return SafeArea(
      child: WarframeScaffold(
        screenName: 'activities',
        child: FutureBuilder<Warframe>(
            future: _data.getWarframes(randomWarframe()),
            builder: (BuildContext context, AsyncSnapshot<Warframe> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(backgroundColor: Colors.white),
                    SizedBox(height: 5),
                    Text('Getting warframes...'),
                  ],
                );
              } else {
                print(_warframe.length);
                return RefreshIndicator(
                  onRefresh: _refresh,
                  child: ListView.builder(
                      itemCount: _warframe.length,
                      itemBuilder: (BuildContext context, i) {
                        return DummyWarframe(
                          imageName: _warframe[i].imageName,
                          name: _warframe[i].name,
                          health: _warframe[i].health,
                          armor: _warframe[i].armor,
                          stamina: _warframe[i].stamina,
                          sprintSpeed: _warframe[i].sprintSpeed,
                        );
                      }),
                );
              }
            }),
      ),
    );
  }
}

class DummyWarframe extends StatelessWidget {
  final String imageName, name;
  final int health, armor, stamina;
  final double sprintSpeed;

  const DummyWarframe({
    Key key,
    this.imageName,
    this.name,
    this.health,
    this.armor,
    this.stamina,
    this.sprintSpeed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              // child: Image.network(imageName),
            ),
            Text('name: $name' ?? 'classified', style: TextStyle(fontSize: 18)),
            Text('health: $health' ?? 'classified',
                style: TextStyle(fontSize: 18)),
            Text('armor: $armor' ?? 'classified',
                style: TextStyle(fontSize: 18)),
            Text('sprintSpeed: $sprintSpeed' ?? 'classified',
                style: TextStyle(fontSize: 18)),
            Text('stamina: $stamina' ?? 'classified',
                style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
