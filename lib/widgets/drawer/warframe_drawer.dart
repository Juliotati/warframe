import 'package:flutter/material.dart';

import 'alias_assets.dart';
import 'alias_profile.dart';
import 'drawer_footer.dart';
import 'drawer_item_list.dart';

class WarframeDrawer extends StatelessWidget {
  const WarframeDrawer({Key key, this.alias}) : super(key: key);

  final String alias;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Container(
          color: Colors.black.withOpacity(0.8),
          child: Column(
            children: <Widget>[
              AliasProfile(alias: alias),
              const AliasAssets(),
              const DrawerItemList(),
              const Spacer(),
              const DrawerFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
