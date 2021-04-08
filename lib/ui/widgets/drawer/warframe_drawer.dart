import 'package:flutter/material.dart';

import 'alias_profile.dart';
import 'drawer_footer.dart';
import 'drawer_item_list.dart';

class WarframeDrawer extends StatelessWidget {
  const WarframeDrawer();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Container(
          color: Colors.black.withOpacity(0.8),
          child: Column(
            children: const <Widget>[
              AliasProfile(),
              DrawerItemList(),
              Spacer(),
              DrawerFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
