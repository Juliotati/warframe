import 'package:flutter/material.dart';
import 'package:warframe/modals/drawer_items.dart';
import 'package:warframe/ui/screens/activities.dart';
import 'package:warframe/ui/screens/codex.dart';
import 'package:warframe/ui/screens/news.dart';

class DrawerProvider with ChangeNotifier {
  List<DrawerItem> drawerList(BuildContext context) {
    return <DrawerItem>[
      DrawerItem(
        leadingIcon: Icons.warning,
        label: 'Activities',
        trailingIcon: Icons.arrow_forward_ios,
        navigation: ActivitiesScreen.route,
      ),
      DrawerItem(
        leadingIcon: Icons.receipt,
        label: 'News',
        trailingIcon: Icons.arrow_forward_ios,
        navigation: NewsScreen.route,
      ),
      DrawerItem(
        leadingIcon: Icons.inbox,
        label: 'Codex',
        trailingIcon: Icons.arrow_forward_ios,
        navigation: CodexScreen.route,
      ),
      DrawerItem(
        leadingIcon: Icons.storage,
        label: 'Inventory',
        trailingIcon: Icons.arrow_forward_ios,
        navigation: ActivitiesScreen.route,
      ),
      DrawerItem(
        leadingIcon: Icons.pets,
        label: 'Companions',
        trailingIcon: Icons.arrow_forward_ios,
        navigation: ActivitiesScreen.route,
      ),
      DrawerItem(
        leadingIcon: Icons.color_lens,
        label: 'Arsenal',
        trailingIcon: Icons.arrow_forward_ios,
        navigation: ActivitiesScreen.route,
      ),
      DrawerItem(
        leadingIcon: Icons.vpn_key,
        label: 'Void Relics',
        trailingIcon: Icons.arrow_forward_ios,
        navigation: ActivitiesScreen.route,
      ),
      DrawerItem(
        leadingIcon: Icons.build,
        label: 'Foundry',
        trailingIcon: Icons.arrow_forward_ios,
        navigation: ActivitiesScreen.route,
      ),
      DrawerItem(
        leadingIcon: Icons.settings,
        label: 'Settings',
        trailingIcon: Icons.arrow_forward_ios,
        navigation: ActivitiesScreen.route,
      ),
    ];
  }
}
