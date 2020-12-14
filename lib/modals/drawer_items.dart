import 'package:flutter/material.dart';
import 'package:warframe/screens/activities.dart';
import 'package:warframe/screens/codex_warframes.dart';
import 'package:warframe/screens/news.dart';

class DrawerItem {
  final IconData leadingIcon;
  final String label;
  final IconData trailingIcon;
  final String navigation;

  DrawerItem({
    this.leadingIcon,
    this.label,
    this.trailingIcon,
    this.navigation,
  });
}

class DrawerProvider with ChangeNotifier {
  List<DrawerItem> myList(context) {
    return [
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
        navigation: CodexWarframesScreen.route,
      ),
      DrawerItem(
        leadingIcon: Icons.storage,
        label: 'Inventory',
        trailingIcon: Icons.arrow_forward_ios,
      ),
      DrawerItem(
        leadingIcon: Icons.pets,
        label: 'Companions',
        trailingIcon: Icons.arrow_forward_ios,
      ),
      DrawerItem(
        leadingIcon: Icons.color_lens,
        label: 'Arsenal',
        trailingIcon: Icons.arrow_forward_ios,
      ),
      DrawerItem(
        leadingIcon: Icons.vpn_key,
        label: 'Void Relics',
        trailingIcon: Icons.arrow_forward_ios,
      ),
      DrawerItem(
        leadingIcon: Icons.build,
        label: 'Foundry',
        trailingIcon: Icons.arrow_forward_ios,
      ),
      DrawerItem(
        leadingIcon: Icons.settings,
        label: 'Settings',
        trailingIcon: Icons.arrow_forward_ios,
      ),
    ];
  }

}
