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

class _WarframeThumbnailAndBio extends StatelessWidget {
  const _WarframeThumbnailAndBio({
    Key? key,
    required this.warframe,
  }) : super(key: key);

  final WarframeModel warframe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Hero(
            tag: warframe.wikiaThumbnail ?? kImagePlaceholder,
            child: Material(
              color: const Color.fromRGBO(0, 0, 0, 0.0),
              child: WarframeContainer(
                margin: 0.0,
                height: 250,
                showImage: true,
                withShadow: true,
                fit: BoxFit.contain,
                backgroundImage: warframe.wikiaThumbnail,
              ),
            ),
          ),
          Positioned(
            bottom: -40.0,
            left: 15.0,
            right: 15.0,
            child: WarframeContainer(
              horizontalPadding: 10.0,
              margin: 0.0,
              withShadow: true,
              child: Text(
                warframe.description,
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: const Color.fromRGBO(0, 0, 0, 1.0),
                    ),
                softWrap: true,
              ),
            ),
          ),
        ],
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
            // const Spacer(),
            IconButton(
              icon: const Icon(Icons.cancel),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
    );
  }
}
