import 'package:flutter/material.dart';

import 'alias_assets.dart';
import 'alias_profile.dart';
import 'drawer_footer.dart';
import 'drawer_item_list.dart';

class WarframeDrawer extends StatelessWidget {
  final String alias;

  const WarframeDrawer({Key key, this.alias}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Container(
          color: Colors.black.withOpacity(0.8),
          child: Column(
            children: [
              AliasProfile(alias: alias),
              AliasAssets(),
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
