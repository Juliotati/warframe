part of presentation;

List<DrawerItemModel> drawerItems = <DrawerItemModel>[
  DrawerItemModel(
    leadingIcon: Icons.warning,
    label: 'Activities',
    trailingIcon: Icons.arrow_forward_ios,
    screen: Screen.activities,
  ),
  DrawerItemModel(
    leadingIcon: Icons.receipt,
    label: 'News',
    trailingIcon: Icons.arrow_forward_ios,
    screen: Screen.news,
  ),
  DrawerItemModel(
    leadingIcon: Icons.inbox,
    label: 'Codex',
    trailingIcon: Icons.arrow_forward_ios,
    screen: Screen.codex,
  ),
  DrawerItemModel(
    leadingIcon: Icons.storage,
    label: 'Inventory',
    trailingIcon: Icons.arrow_forward_ios,
    screen: Screen.inventory,
  ),
  DrawerItemModel(
    leadingIcon: Icons.pets,
    label: 'Companions',
    trailingIcon: Icons.arrow_forward_ios,
    screen: Screen.companions,
  ),
  DrawerItemModel(
    leadingIcon: Icons.color_lens,
    label: 'Arsenal',
    trailingIcon: Icons.arrow_forward_ios,
    screen: Screen.arsenal,
  ),
  DrawerItemModel(
    leadingIcon: Icons.vpn_key,
    label: 'Void Relics',
    trailingIcon: Icons.arrow_forward_ios,
    screen: Screen.voidRelics,
  ),
  DrawerItemModel(
    leadingIcon: Icons.build,
    label: 'Foundry',
    trailingIcon: Icons.arrow_forward_ios,
    screen: Screen.foundry,
  ),
  DrawerItemModel(
    leadingIcon: Icons.settings,
    label: 'Settings',
    trailingIcon: Icons.arrow_forward_ios,
    screen: Screen.settings,
  ),
];
