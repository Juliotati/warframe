import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:warframe/screens/codex/warfames/warframe_profile.dart';

class CodexGridItem extends StatelessWidget {
  CodexGridItem({
    this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    void selectedWarframe(BuildContext context) {
      Navigator.of(context).pushNamed(
        WarframeProfile.route,
        arguments: name,
      );
    }

    return InkWell(
      onTap: () => selectedWarframe(context),
      child: GridTile(
        child: Card(
          margin: EdgeInsets.all(0),
        ),
        footer: Container(
          height: 30,
          child: GridTileBar(
            title: Text(
              name.toUpperCase(),
              style: Theme.of(context).textTheme.subtitle1.copyWith(
                    color: Colors.black,
                  ),
            ),
            backgroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
