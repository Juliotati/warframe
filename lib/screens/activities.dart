import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:warframe/modals/warframe.dart';
import 'package:warframe/service/codex.dart';
import 'package:warframe/service/http.dart';
import 'package:warframe/utilities/scaffold.dart';

class ActivitiesScreen extends StatelessWidget {
  static const route = 'activities_screen';

  String ran(){
    final rand = Random();
    final index = rand.nextInt(CODEX_WARFRAME.length);
    print(CODEX_WARFRAME[index]);
    return CODEX_WARFRAME[index];
  }

  @override
  Widget build(BuildContext context) {
    final wr = Provider.of<WarframeData>(context, listen: false);
    return WarframeScaffold(
      screenName: 'activities',
      child: FutureBuilder<Warframe>(
          future: wr.getWarframes(ran()),
          builder: (BuildContext context, AsyncSnapshot<Warframe> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    backgroundColor: Colors.white,
                  ),
                  Text('Getting warframes...'),
                ],
              );
            } else {
              print(wr.warframes.length);
              return ListView.builder(
                  itemCount: wr.warframes.length,
                  itemBuilder: (BuildContext context, i) {
                    return DummyWarframe(
                      imageName: wr.warframes[i].imageName,
                      name: wr.warframes[i].name,
                      health: wr.warframes[i].health,
                      armor: wr.warframes[i].armor,
                      stamina: wr.warframes[i].stamina,
                    );
                  });
            }
          }),
    );
  }
}

class DummyWarframe extends StatelessWidget {
  final String imageName,name;
  final int health;
  final int armor;

  final int stamina;

  const DummyWarframe({
    Key key,
    this.imageName,
    this.name,
    this.health,
    this.armor,
    this.stamina,
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
            Text('stamina: $stamina' ?? 'classified',
                style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
