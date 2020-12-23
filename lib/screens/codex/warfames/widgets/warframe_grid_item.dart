import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warframe/modals/codex_modals.dart';
import 'package:warframe/screens/codex/warfames/warframe_profile.dart';

class WarframeGridItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final codexWarframe = Provider.of<Warframe>(context);
    void selectedWarframe(BuildContext context) {
      Navigator.of(context).pushNamed(
        WarframeProfile.route,
        arguments: codexWarframe.name,
      );
    }

    return InkWell(
      onTap: () => selectedWarframe(context),
      child: GridTile(
        child: Image.network(
          codexWarframe.image,
          fit: BoxFit.cover,
        ),
        footer: Container(
          height: 30,
          child: GridTileBar(
            title: Text(
              '${codexWarframe.name}'.toUpperCase(),
              style: Theme.of(context).textTheme.subtitle1,
            ),
            backgroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
