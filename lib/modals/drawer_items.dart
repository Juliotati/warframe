import 'package:flutter/material.dart';

class DrawerItem {
  DrawerItem({
    this.leadingIcon,
    this.label,
    this.trailingIcon,
    this.navigation,
  });

  final IconData? leadingIcon;
  final String? label;
  final IconData? trailingIcon;
  final String? navigation;
}
