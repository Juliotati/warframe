import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../app_data/codex.dart';
import '../widgets/codex_warframe_card.dart';
import '../widgets/warframe_drawer.dart';

class CodexWarframe extends StatelessWidget {
  static const route = 'codex_screen';

  @override
  Widget build(BuildContext context) {
    final warframeName = ModalRoute.of(context).settings.arguments as String;
    final selectedWarframe =
        Provider.of<CodexWarframes>(context).findByName(warframeName);
    return SafeArea(
      child: Scaffold(
//        drawerEdgeDragWidth: 50,
//        drawerEnableOpenDragGesture: true,
//        drawer: WarframeDrawer(),
        appBar: AppBar(
          title: Center(
            child: Text(
              'Codex-Warframe'.toUpperCase(),
              style: GoogleFonts.roboto(fontSize: 24),
            ),
          ),
          actions: [
            Icon(Icons.people),
            SizedBox(width: 8),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(Icons.chat_bubble),
            )
          ],
          backgroundColor: Colors.transparent.withOpacity(0.4),
          bottomOpacity: 80,
        ),
        body: Container(
          height: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/ship.jpg'), fit: BoxFit.cover)),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Column(
                children: [
                  Container(
//                    height: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 8.0),
                      color: Colors.black26.withOpacity(0.7),
                      child: Column(
                        children: [
                          // This is the warframe name
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            height: 45,
                            width: double.infinity,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                '${selectedWarframe.name}'.toUpperCase(),
                                style: Theme.of(context).textTheme.headline3,
                              ),
                            ),
                            color: Colors.white,
                          ),
//               This is the images of the warframe
                          Container(
                            child: Image.network(selectedWarframe.image),
                          ),
                          Divider(
                              height: 16.0, color: Colors.grey, thickness: 1),
                          // This is the warframe's bio
                          Container(
                            color: Colors.transparent,
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              '${selectedWarframe.bio}',
                              style: Theme.of(context).textTheme.bodyText2,
                              softWrap: true,
                            ),
                          ),
                          Divider(
                              height: 16.0, color: Colors.grey, thickness: 1),
                          // This is the warframe's attributes
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Text('health'.toUpperCase(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text('${selectedWarframe.health}',
                                      style:
                                          Theme.of(context).textTheme.bodyText2)
                                ],
                              ),
                              Column(
                                children: [
                                  Text('shield'.toUpperCase(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text('${selectedWarframe.shield}',
                                      style:
                                          Theme.of(context).textTheme.bodyText2)
                                ],
                              ),
                              Column(
                                children: [
                                  Text('armor'.toUpperCase(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text('${selectedWarframe.armor}',
                                      style:
                                          Theme.of(context).textTheme.bodyText2)
                                ],
                              ),
                              Column(
                                children: [
                                  Text('energy'.toUpperCase(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text('${selectedWarframe.energy}',
                                      style:
                                          Theme.of(context).textTheme.bodyText2)
                                ],
                              ),
                              Column(
                                children: [
                                  Text('sprint'.toUpperCase(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2),
                                  SizedBox(height: 8),
                                  Text('${selectedWarframe.sprint}',
                                      style:
                                          Theme.of(context).textTheme.bodyText2)
                                ],
                              ),
                            ],
                          ),
                          Divider(
                              height: 16.0, color: Colors.grey, thickness: 1),
                          ExpansionTile(
                            title: Text('abilities'.toUpperCase(),
                                style: Theme.of(context).textTheme.headline5),
                            trailing: Icon(
                              Icons.drag_handle,
                              color: Colors.grey,
                            ),
                            children: [
                              // This are the abilities of the warframe
                              Column(
                                children: [
                                  ListTile(
//                          leading: Image.network(abilityOneImage),
                                    title: Text(
                                        '${selectedWarframe.abilityOneName}'
                                            .toUpperCase(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2
                                            .copyWith(
                                                fontWeight: FontWeight.bold)),
                                    subtitle: Text(
                                        '${selectedWarframe.abilityOne}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2),
                                  ),
                                  SizedBox(
                                      width: 350,
                                      child: Divider(
                                          height: 5.0, color: Colors.grey)),
                                  ListTile(
//                          leading: Image.network(abilityOneImage),
                                    title: Text(
                                        '${selectedWarframe.abilityTwoName}'
                                            .toUpperCase(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2
                                            .copyWith(
                                                fontWeight: FontWeight.bold)),
                                    subtitle: Text(
                                        '${selectedWarframe.abilityTwo}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2),
                                  ),
                                  SizedBox(
                                      width: 350,
                                      child: Divider(
                                          height: 5.0, color: Colors.grey)),
                                  ListTile(
//                          leading: Image.network(abilityOneImage),
                                    title: Text(
                                        '${selectedWarframe.abilityThreeName}'
                                            .toUpperCase(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2
                                            .copyWith(
                                                fontWeight: FontWeight.bold)),
                                    subtitle: Text(
                                        '${selectedWarframe.abilityThree}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2),
                                  ),
                                  SizedBox(
                                      width: 350,
                                      child: Divider(
                                          height: 5.0, color: Colors.grey)),
                                  ListTile(
//                          leading: Image.network(abilityOneImage),
                                    title: Text(
                                        '${selectedWarframe.abilityFourName}'
                                            .toUpperCase(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2
                                            .copyWith(
                                                fontWeight: FontWeight.bold)),
                                    subtitle: Text(
                                        '${selectedWarframe.abilityFour}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2),
                                  ),
                                  Divider(
                                      height: 5,
                                      thickness: 1,
                                      color: Colors.grey),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: ListTile(
//                          leading: Image.network(abilityOneImage),
                                      title: Text(
                                          '${selectedWarframe.passive}'
                                              .toUpperCase(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2
                                              .copyWith(
                                                  fontWeight: FontWeight.bold)),
                                      subtitle: Text(
                                          '${selectedWarframe.passiveBio}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
