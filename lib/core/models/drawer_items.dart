import 'package:flutter/material.dart';
import 'package:warframe/core/helpers/screen_delegate.dart';

class DrawerItemModel {
  DrawerItemModel({
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
