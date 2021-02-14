import 'package:flutter/material.dart';

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

