import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:warframe/modals/warframe.dart';
import 'package:warframe/utilities/placeholders.dart';

import 'file:///C:/Users/user/Desktop/Development/Others/warframe/lib/screens/warframe_profile.dart';

class CodexGridItem extends StatelessWidget {
  const CodexGridItem({
    this.warframe,
    this.type,
  });

  final Warframe warframe;
  final int type;

  @override
  Widget build(BuildContext context) {
    void selectedWarframe(BuildContext context) {
      Navigator.of(context).pushNamed(
        WarframeProfile.route,
        arguments: <String, dynamic>{
          'name': warframe.name,
          'type': type,
        },
      );
    }

    return InkWell(
      onTap: () => selectedWarframe(context),
      child: GridTile(
        footer: SizedBox(
          height: 30,
          child: GridTileBar(
            title: Text(
              warframe.name.toUpperCase(),
              style: Theme.of(context).textTheme.subtitle1.copyWith(
                    color: Colors.black,
                  ),
            ),
            backgroundColor: Colors.white,
          ),
        ),
        child: Card(
          color: Colors.black54,
          margin: const EdgeInsets.all(0),
          child: Image.network(
            warframe.wikiaThumbnail ?? imagePlaceholder,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
