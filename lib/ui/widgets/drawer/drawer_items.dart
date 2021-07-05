import 'package:flutter/material.dart';
import 'package:warframe/export/warframe_ui.dart';
import 'package:warframe/modals/drawer_items.dart';
import 'package:warframe/ui/screens/codex_categories.dart';
import 'package:warframe/ui/screens/news.dart';
import 'package:warframe/ui/screens/wrapper.dart';

List<DrawerItem> drawerItems = <DrawerItem>[
  DrawerItem(
    leadingIcon: Icons.warning,
    label: 'Activities',
    trailingIcon: Icons.arrow_forward_ios,
    screen: Screen.activities,
  ),
  DrawerItem(
    leadingIcon: Icons.receipt,
    label: 'News',
    trailingIcon: Icons.arrow_forward_ios,
    screen: Screen.news,
  ),
  DrawerItem(
    leadingIcon: Icons.inbox,
    label: 'Codex',
    trailingIcon: Icons.arrow_forward_ios,
    screen: Screen.codex,
  ),
  DrawerItem(
    leadingIcon: Icons.storage,
    label: 'Inventory',
    trailingIcon: Icons.arrow_forward_ios,
    screen: Screen.inventory,
  ),
  DrawerItem(
    leadingIcon: Icons.pets,
    label: 'Companions',
    trailingIcon: Icons.arrow_forward_ios,
    screen: Screen.companions,
  ),
  DrawerItem(
    leadingIcon: Icons.color_lens,
    label: 'Arsenal',
    trailingIcon: Icons.arrow_forward_ios,
    screen: Screen.arsenal,
  ),
  DrawerItem(
    leadingIcon: Icons.vpn_key,
    label: 'Void Relics',
    trailingIcon: Icons.arrow_forward_ios,
    screen: Screen.voidRelics,
  ),
  DrawerItem(
    leadingIcon: Icons.build,
    label: 'Foundry',
    trailingIcon: Icons.arrow_forward_ios,
    screen: Screen.foundry,
  ),
  DrawerItem(
    leadingIcon: Icons.settings,
    label: 'Settings',
    trailingIcon: Icons.arrow_forward_ios,
    screen: Screen.settings,
  ),
];
