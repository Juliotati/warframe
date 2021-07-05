import 'package:flutter/material.dart';
import 'package:warframe/export/warframe_ui.dart';
import 'package:warframe/modals/drawer_items.dart';
import 'package:provider/provider.dart';
import 'package:warframe/ui/screens/wrapper.dart';
import 'drawer_items.dart';
import 'drawer_items_list.dart';

class ItemsColumn extends StatelessWidget {
  const ItemsColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: drawerItems
              .map((DrawerItem item) => DrawerItemList(
                    leadingIcon: item.leadingIcon,
                    label: item.label,
                    onTap: () {
                      Navigator.of(context).pop();
                      return context.read<LayoutHelper>().updateScreen(
                            item.screen,
                            item.label,
                          );
                    },
                  ))
              .toList(),
        ),
      ),
    );
  }
}
