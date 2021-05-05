import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:warframe/modals/warframe.dart';
import 'package:warframe/ui/screens/warframe_profile.dart';
import 'package:warframe/ui/utilities/placeholders.dart';

class CodexGridItem extends StatelessWidget {
  const CodexGridItem({
    this.warframe,
  });

  final Warframe warframe;

  void selectedWarframe(BuildContext context) =>
      Navigator.of(context).pushNamed(
        WarframeProfile.route,
        arguments: warframe.name,
      );

  @override
  Widget build(BuildContext context) {
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
            warframe.wikiaThumbnail ?? kImagePlaceholder,
            errorBuilder: (BuildContext context, Object object, _) {
              return Image.network(kImagePlaceholder);
            },
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
