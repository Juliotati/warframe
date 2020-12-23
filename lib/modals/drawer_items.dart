import 'package:flutter/material.dart';
import 'package:warframe/screens/activities.dart';
import 'file:///C:/Users/user/Desktop/Development/Others/warframe/lib/screens/codex/codex.dart';
import 'file:///C:/Users/user/Desktop/Development/Others/warframe/lib/screens/news/news.dart';

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
  List<DrawerItem> myList(BuildContext context) {
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
