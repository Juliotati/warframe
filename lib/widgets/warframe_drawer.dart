import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
                style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    constraints: BoxConstraints(maxHeight: 120, minHeight: 110),
                    child: Flexible(flex: 1, child: Image.network('$avatar')),
                    // height: 120,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Column(
                      children: [
                        // This is the player rank
                        Text(
            '24',
            style: GoogleFonts.roboto(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold),
                        ),
                        // This is the player rank name
                        Text('Gold Dragon'.toUpperCase(),
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontSize: 16,
              ))
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
                    Text('$money',
                        style: GoogleFonts.roboto(color: Colors.white)),
                    SizedBox(width: 150),
                    Container(child: Image.network('$plats'), height: 20),
                    Text('$plat',
                        style: GoogleFonts.roboto(color: Colors.white))
                  ],
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 4),
              color: Colors.grey[900],
            ),
            Expanded(flex: 1, child: DrawerItemList()),
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
    final drawerItems = Provider.of<DrawerProvider>(context).myList(context);

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
          Text('ps4'.toLowerCase(),
              style: GoogleFonts.roboto(color: Colors.grey)),
          Text('4.9.0.3', style: GoogleFonts.roboto(color: Colors.grey)),
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
            style: GoogleFonts.roboto(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
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
