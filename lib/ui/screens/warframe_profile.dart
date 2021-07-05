import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warframe/modals/warframe.dart';
import 'package:warframe/service/warframe_network.dart';
import 'package:warframe/ui/utilities/utilities.dart';
import 'package:warframe/ui/widgets/abilities.dart';
import 'package:warframe/ui/widgets/attributes.dart';

class WarframeProfile extends StatefulWidget {
  const WarframeProfile();

  static const String route = 'warframe-profile';

  @override
  _WarframeProfileState createState() => _WarframeProfileState();
}

class _WarframeProfileState extends State<WarframeProfile> {
  @override
  Widget build(BuildContext context) {
    final String _warframeName =
        ModalRoute.of(context)!.settings.arguments! as String;

    return WarframeScaffold(
      screenName: 'Warframe',
      child: SafeArea(
        child: Consumer<WarframeNetwork>(
          builder: (_, WarframeNetwork _network, __) {
            return WarframeInfo(
              warframe: _network.getWarframe(_warframeName),
            );
          },
        ),
      ),
    );
  }
}

class WarframeInfo extends StatelessWidget {
  const WarframeInfo({
    Key? key,
    required this.warframe,
  }) : super(key: key);

  final Warframe warframe;

  @override
  Widget build(BuildContext context) {
    debugPrint(warframe.wikiaThumbnail);
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
                      style: Theme.of(context).textTheme.headline3!.copyWith(
                            color: Colors.black,
                            fontSize: 22,
                          ),
                    ),
                  ),
                ),
                Image.network(
                  warframe.wikiaThumbnail ?? kImagePlaceholder,
                  errorBuilder: (_,__, ___) {
                    return Image.network(kImagePlaceholder);
                  },
                  fit: BoxFit.contain,
                  height: 250,
                ),
                const InfoDivider(),
                Padding(
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
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(height: 16.0, color: Colors.grey, thickness: 1);
  }
}
