import 'package:flutter/material.dart';

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key key,
    this.leadingIcon,
    this.trailingIcon,
    this.label,
    this.onTap,
  }) : super(key: key);

  final IconData leadingIcon, trailingIcon;
  final String label;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(
            leadingIcon,
            color: Colors.grey,
          ),
          title: Text(
            label.toUpperCase(),
          ),
          trailing: Icon(
            trailingIcon,
            color: Colors.grey,
          ),
          onTap: onTap,
        ),
        const Divider(height: 0.0, color: Colors.grey),
      ],
    );
  }
}
