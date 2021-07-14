import 'package:flutter/material.dart';
import '../../data/models/warframe_model.dart';

import '../widgets/widgets.dart';

class WarframeProfile extends StatelessWidget {
  const WarframeProfile();

  static const String route = 'warframe-profile';

  @override
  Widget build(BuildContext context) {
    final WarframeModel warframe = ModalRoute.of(context)!.settings.arguments! as WarframeModel;
    return CodexDataScaffold(
      label: warframe.name,
      icon: Icons.cancel,
      body: CodexItemDetailsBodyWrapper(
        children: <Widget>[
          WarframeThumbnailAndBio(warframe: warframe),
          const SizedBox(height: 50.0),
          AttributesList(warframe: warframe),
          const SizedBox(height: 10.0),
          AbilitiesList(warframe: warframe),
          const SizedBox(height: 50.0),
        ],
      ),
    );
  }
}
