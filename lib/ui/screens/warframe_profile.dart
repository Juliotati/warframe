import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warframe/modals/warframe.dart';
import 'package:warframe/service/warframe_network.dart';
import 'package:warframe/ui/utilities/placeholders.dart';
import 'package:warframe/ui/utilities/scaffold.dart';
import 'package:warframe/ui/widgets/abilities.dart';
import 'package:warframe/ui/widgets/attributes.dart';

class WarframeProfile extends StatefulWidget {
  static const String route = 'Warframe_Profile';

  @override
  _WarframeProfileState createState() => _WarframeProfileState();
}

class _WarframeProfileState extends State<WarframeProfile> {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> arg =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;

    final String _warframeName = arg['name'];
    final int _warframeType = arg['type'];
    final String _name =
        _warframeName.replaceAll('Prime', '').toLowerCase().trim();
    final WarframeNetwork _network = Provider.of<WarframeNetwork>(
      context,
      listen: false,
    );
    return WarframeScaffold(
      screenName: 'Warframe',
      child: SafeArea(
        child: FutureBuilder<Warframe>(
          future: _network.getWarframe(_name, _warframeType),
          builder: (BuildContext context, AsyncSnapshot<Warframe> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const LoadingIndicator('Fetching Warframe Data');
            }
            if (snapshot.hasError) {
              return const WarframeError();
            } else {
              return WarframeInfo(
                warframe: snapshot.data,
              );
            }
          },
        ),
      ),
    );
  }
}

class WarframeInfo extends StatelessWidget {
  const WarframeInfo({
    Key key,
    this.warframe,
  }) : super(key: key);

  final Warframe warframe;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: Alignment.topCenter,
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            color: Colors.black26.withOpacity(0.7),
            child: Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  height: 45,
                  width: double.infinity,
                  color: Colors.white,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      warframe.name,
                      style: Theme.of(context).textTheme.headline3.copyWith(
                            color: Colors.black,
                            fontSize: 22,
                          ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 250,
                  child: Image.network(
                    warframe.wikiaThumbnail ?? kImagePlaceholder,
                    errorBuilder: (BuildContext context, Object object, _) {
                      return Image.network(kImagePlaceholder);
                    },
                    fit: BoxFit.contain,
                  ),
                ),
                const InfoDivider(),
                Container(
                  color: Colors.transparent,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    warframe.description,
                    style: Theme.of(context).textTheme.bodyText2,
                    softWrap: true,
                  ),
                ),
                const InfoDivider(),
                Attributes(warframe: warframe),
                const InfoDivider(),
                AbilitiesTile(warframe: warframe),
                const SizedBox(height: 30.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class InfoDivider extends StatelessWidget {
  const InfoDivider({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(height: 16.0, color: Colors.grey, thickness: 1);
  }
}