import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warframe/modals/warframe.dart';
import 'package:warframe/screens/codex/warfames/widgets/attributes.dart';
import 'package:warframe/screens/codex/warfames/widgets/abilities.dart' as widget;
import 'package:warframe/service/http.dart';
import 'package:warframe/utilities/scaffold.dart';

class WarframeProfile extends StatefulWidget {
  static const route = 'Warframe_Profile';

  @override
  _WarframeProfileState createState() => _WarframeProfileState();
}

class _WarframeProfileState extends State<WarframeProfile> {
  @override
  Widget build(BuildContext context) {
    final warframeName = ModalRoute.of(context).settings.arguments as String;
    try {
      return WarframeScaffold(
        screenName: 'Warframe',
        child: FutureBuilder<Warframe>(
            future: Provider.of<WarframeData>(context).getWarframes(warframeName),
            builder: (BuildContext context, AsyncSnapshot<Warframe> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      backgroundColor: Colors.white,
                    ),
                    Text('Getting warframe data...'),
                  ],
                );
              } else {
                final frame = Provider.of<WarframeData>(context)
                    .byName(warframeName);
                return Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 8.0),
                      color: Colors.black26.withOpacity(0.7),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            height: 45,
                            width: double.infinity,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                frame.name.toUpperCase(),
                                style: Theme.of(context).textTheme.headline3,
                              ),
                            ),
                            color: Colors.white,
                          ),
                          // Container(
                          //   child: Image.network(frame.imageName),
                          // ),
                          Divider(
                              height: 16.0, color: Colors.grey, thickness: 1),
                          Container(
                            color: Colors.transparent,
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              frame.description,
                              style: Theme.of(context).textTheme.bodyText2,
                              softWrap: true,
                            ),
                          ),
                          Divider(
                              height: 16.0, color: Colors.grey, thickness: 1),
                          Attributes(warframe: frame),
                          Divider(
                              height: 16.0, color: Colors.grey, thickness: 1),
                          widget.Abilities(warframe: frame),
                        ],
                      ),
                    ),
                  ],
                );
              }
            }),
      );
    } catch (e) {
      throw e;
    }
  }
}
