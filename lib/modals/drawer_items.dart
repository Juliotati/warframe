import 'package:flutter/material.dart';
import 'package:warframe/ui/screens/wrapper.dart';

class DrawerItem {
  DrawerItem({
    required this.leadingIcon,
    required this.label,
    this.trailingIcon,
    required this.screen,
  });

  final IconData leadingIcon;
  final String label;
  final IconData? trailingIcon;
  final Screen screen;
}
