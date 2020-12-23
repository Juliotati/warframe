import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warframe/modals/drawer_items.dart';
import 'package:warframe/utilities/assets.dart';

class WarframeDrawer extends StatelessWidget {
  final String alias;

  const WarframeDrawer({Key key, this.alias}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.black.withOpacity(0.8),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                alias ?? 'blazertherazer12',
                textAlign: TextAlign.left,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  constraints: BoxConstraints(maxHeight: 120, minHeight: 110),
                  child: Image.network('$avatar'),
                  // height: 120,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Column(
                    children: [
                      Text('24'),
                      Text(
                        'Gold Dragon'.toUpperCase(),
                      )
                    ],
                  ),
                )
              ],
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(child: Image.network('$credit'), height: 20),
                    Text('$money'),
                    SizedBox(width: 150),
                    Container(child: Image.network('$plats'), height: 20),
                    Text('$plat')
                  ],
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 4),
              color: Colors.grey[900],
            ),
            DrawerItemList(),
            Spacer(),
            DrawerFooter(),
          ],
        ),
      ),
    );
  }
}

class DrawerItemList extends StatelessWidget {
  const DrawerItemList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final  drawerItems = Provider.of<DrawerProvider>(context).myList(context);
    return Column(
      children: drawerItems
          .map(
            (item) => DrawerListTile(
              leadingIcon: item.leadingIcon,
              label: item.label,
              trailingIcon: item.trailingIcon,
              onTap: () => Navigator.of(context).pushNamed(item.navigation),
            ),
          )
          .toList(),
    );
  }
}

class DrawerFooter extends StatelessWidget {
  const DrawerFooter({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'ps4'.toLowerCase(),
          ),
          Text(
            '4.9.0.3',
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  final IconData leadingIcon, trailingIcon;
  final String label;
  final Function onTap;

  const DrawerListTile({
    Key key,
    this.leadingIcon,
    this.trailingIcon,
    this.label,
    this.onTap,
  }) : super(key: key);

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
        Divider(height: 0.0, color: Colors.grey),
      ],
    );
  }
}