import 'package:flutter/material.dart';

import 'alias_profile.dart';
import 'drawer_footer.dart';
import 'items_column.dart';

class WarframeDrawer extends StatelessWidget {
  const WarframeDrawer();

  @override
  Widget build(BuildContext context) {
    final Size _screen = MediaQuery.of(context).size;
    return SafeArea(
      child: Drawer(
        child: Container(
          width: _screen.width,
          color: const Color.fromRGBO(0, 0, 0, 0.8),
          child: Column(
            children: const <Widget>[
              AliasProfile(),
          SizedBox(height: 10.0),
              ItemsColumn(),
              DrawerFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
