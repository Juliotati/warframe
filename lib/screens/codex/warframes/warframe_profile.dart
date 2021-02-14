import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warframe/modals/warframe/warframe.dart';
import 'package:warframe/screens/codex/warframes/widgets/attributes.dart';
import 'package:warframe/screens/codex/warframes/widgets/abilities.dart';
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
    final WarframeData _networkData = Provider.of<WarframeData>(context);
    final Warframe _localWarframe = WarframeData().byName(warframeName);
    try {
      return WarframeScaffold(
        screenName: 'Warframe',
        child: FutureBuilder<Warframe>(
            future: _networkData.getWarframe(warframeName),
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
                                _localWarframe.name ?? '',
                                style: Theme.of(context).textTheme.headline3,
                              ),
                            ),
                            color: Colors.white,
                          ),
                          // Container(
                          //   child: Image.network(_localWarframe.imageName),
                          // ),
                          Divider(
                              height: 16.0, color: Colors.grey, thickness: 1),
                          Container(
                            color: Colors.transparent,
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              _localWarframe.description ?? '',
                              style: Theme.of(context).textTheme.bodyText2,
                              softWrap: true,
                            ),
                          ),
                          Divider(
                              height: 16.0, color: Colors.grey, thickness: 1),
                          Attributes(warframe: _localWarframe),
                          Divider(
                              height: 16.0, color: Colors.grey, thickness: 1),
                          // AbilitiesTile(warframe: _localWarframe),
                        ],
                      ),
                    ),
                  ],
                );
              }
            }),
      );
    } catch (e) {
      print('UPS => $e');
      return Text('BIG ERROR!');
    }
  }
}
