import 'package:flutter/material.dart';
import 'package:warframe/features/warframe_codex/presentation/widgets/codex_data_scaffold.dart';

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

    return CodexDataScaffold(
      label: warframe.name,
      icon: Icons.cancel,
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
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 80.0),
          _WarframeThumbnailAndBio(warframe: warframe),
          const SizedBox(height: 50.0),
          Attributes(warframe: warframe),
          const SizedBox(height: 10.0),
          AbilitiesTile(warframe: warframe),
          const SizedBox(height: 100.0),
        ],
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
      onTap: () {},
      image: warframe.wikiaThumbnail,
      label: warframe.description,
      tag: warframe.uniqueName,
      labelTag: warframe.description,
      fontSize: 14,
      maxLines: 9,
    );
  }
}
