import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warframe/modals/drawer_items.dart';

import 'drawer_data.dart';
import 'drawer_list_tile.dart';

class DrawerItemList extends StatelessWidget {
  const DrawerItemList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<DrawerItem> drawerItems =
        Provider.of<DrawerProvider>(context, listen: false).drawerList(context);
    return Column(
      children: drawerItems
          .map((DrawerItem item) => DrawerListTile(
                leadingIcon: item.leadingIcon,
                label: item.label,
                trailingIcon: item.trailingIcon,
                onTap: () => Navigator.of(context).pushNamed(item.navigation),
              ))
          .toList(),
    );
  }
}
