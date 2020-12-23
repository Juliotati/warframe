import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warframe/service/codex.dart';
import 'package:warframe/screens/codex/warfames/widgets/abilities.dart';
import 'package:warframe/screens/codex/warfames/widgets/attributes.dart';
import 'package:warframe/utilities/scaffold.dart';

class WarframeProfile extends StatelessWidget {
  static const route = 'Warframe_Profile';

  @override
  Widget build(BuildContext context) {
    final warframeName = ModalRoute.of(context).settings.arguments as String;
    final selectedWarframe =
        Provider.of<CodexWarframes>(context).findByName(warframeName);
    return WarframeScaffold(
      screenName: 'Warframe',
      child: Column(
        children: [
          Container(
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
                Container(
                  child: Image.network(selectedWarframe.image),
                ),
                Divider(height: 16.0, color: Colors.grey, thickness: 1),
                Container(
                  color: Colors.transparent,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    '${selectedWarframe.bio}',
                    style: Theme.of(context).textTheme.bodyText2,
                    softWrap: true,
                  ),
                ),
                Divider(height: 16.0, color: Colors.grey, thickness: 1),

                Attributes(selectedWarframe: selectedWarframe),
                Divider(height: 16.0, color: Colors.grey, thickness: 1),
                Abilities(selectedWarframe: selectedWarframe),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
