import 'package:flutter/material.dart';

import '../../../../export/warframe_ui.dart';
import '../widgets/abilities.dart';
import '../widgets/attributes.dart';

class WarframeProfile extends StatelessWidget {
  const WarframeProfile();

  static const String route = 'warframe-profile';

  @override
  Widget build(BuildContext context) {
    final WarframeModel warframe =
        ModalRoute.of(context)!.settings.arguments! as WarframeModel;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 0.65),
      body: WarframeInfo(
        key: ValueKey<String>(warframe.uniqueName),
        warframe: warframe,
      ),
    );
  }
}

class WarframeInfo extends StatelessWidget {
  const WarframeInfo({
    Key? key,
    required this.warframe,
  }) : super(key: key);

  final WarframeModel warframe;

  @override
  Widget build(BuildContext context) {
    return WarframeContainer(
      horizontalPadding: 0.0,
      color: const Color.fromRGBO(255, 255, 255, 0.8),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _WarframeName(warframe: warframe),
            _WarframeThumbnailAndBio(warframe: warframe),
            const SizedBox(height: 50.0),
            Attributes(warframe: warframe),
            const SizedBox(height: 10.0),
            AbilitiesTile(warframe: warframe),
            const SizedBox(height: 30.0),
          ],
        ),
      ),
    );
  }
}

class _WarframeName extends StatelessWidget {
  const _WarframeName({
    Key? key,
    required this.warframe,
  }) : super(key: key);

  final WarframeModel warframe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          children: <Widget>[
            Expanded(
              child: WarframeContainer(
                withShadow: true,
                margin: 0.0,
                height: 45,
                child: Text(
                  warframe.name,
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                        color: Colors.black,
                        fontSize: 22,
                      ),
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.cancel),
              iconSize: 35.0,
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
    );
  }
}

class _WarframeThumbnailAndBio extends StatelessWidget {
  const _WarframeThumbnailAndBio({
    Key? key,
    required this.warframe,
  }) : super(key: key);

  final WarframeModel warframe;

  @override
  Widget build(BuildContext context) {
    return StackedContainer(
      height: 360,
      bottom: -40.0,
      key: Key(warframe.uniqueName),
      onTap: (){},
      image: warframe.wikiaThumbnail,
      label: warframe.description,
      tag: warframe.uniqueName,
      labelTag: warframe.description,
      fontSize: 14,
      maxLines: 9,
    );
  }
}
