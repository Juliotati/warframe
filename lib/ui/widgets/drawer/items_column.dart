import 'package:flutter/material.dart';
import 'package:warframe/modals/drawer_items.dart';

import 'drawer_items.dart';
import 'drawer_list_tile.dart';

class ItemsColumn extends StatelessWidget {
  const ItemsColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: drawerItems
              .map((DrawerItem item) => DrawerListTile(
                    leadingIcon: item.leadingIcon,
                    label: item.label,
                    trailingIcon: item.trailingIcon,
                    onTap: () => Navigator.of(context).pushNamed(item.navigation!),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
