import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../screens/login.dart';
import '../screens/codex_warframes.dart';
import '../screens/news.dart';
import '../screens/activities.dart';

// This is a costume made widget that is used to display the item in the app drawer.
Widget buildListTile(
    IconData leadingIcon, String title, IconData trailingIcon, Function onTap) {
  return Column(
    children: [
      ListTile(
        leading: Icon(
          leadingIcon,
          color: Colors.grey,
        ),
        title: Text(
          title.toUpperCase(),
          style: GoogleFonts.roboto(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
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

// These are simple some of the info shown in the app drawer about the user
final double money = 310.817;
final int plat = 87;
// Network images
final String credit =
    'https://vignette.wikia.nocookie.net/warframe/images/0/01/CreditsLarge.png/revision/latest?cb=20130424035955';
final String plats =
    'https://vignette.wikia.nocookie.net/warframe/images/e/e7/PlatinumLarge.png/revision/latest?cb=20130728181159';
final String avatar =
    'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fstore.playstation.com%2Fstore%2Fapi%2Fchihiro%2F00_09_000%2Fcontainer%2FFR%2Ffr%2F999%2FEP2097-CUSA00106_00-AV00000000000013%2F1563810212000%2Fimage%3Fw%3D240%26h%3D240%26bg_color%3D000000%26opacity%3D100%26_version%3D00_09_000&f=1&nofb=1';

// This is the drawer widget
class WarframeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.black.withOpacity(0.8),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      // This is the in game player/alias name
                      child: Text(
                        'blazertherazer12',
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
                          child: Image.network('$avatar'),
                          height: 130,
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
                    SizedBox(height: 10),
                    // This holds info about the credit and platinum the player has
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                child: Image.network('$credit'), height: 20),
                            Text('$money',
                                style: GoogleFonts.roboto(color: Colors.white)),
                            SizedBox(width: 150),
                            Container(
                                child: Image.network('$plats'), height: 20),
                            Text('$plat',
                                style: GoogleFonts.roboto(color: Colors.white))
                          ],
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      color: Colors.grey[900],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 5),
            // These are the costume made list tile items
            // Each has leading widget, title and a trailing widget.
            buildListTile(Icons.warning, 'Activities', Icons.arrow_forward_ios,
                () {
              Navigator.pushNamed(context, ActivitiesScreen.route);
            }),
            buildListTile(Icons.receipt, 'News', Icons.arrow_forward_ios, () {
              Navigator.pushNamed(context, NewsScreen.route);
            }),
            buildListTile(Icons.inbox, 'Codex', Icons.arrow_forward_ios, () {
              Navigator.pushNamed(context, CodexWarframesScreen.route);
            }),
            buildListTile(
                Icons.storage, 'Inventory', Icons.arrow_forward_ios, () {}),
            buildListTile(
                Icons.pets, 'Companions', Icons.arrow_forward_ios, () {}),
            buildListTile(
                Icons.color_lens, 'Arsenal', Icons.arrow_forward_ios, () {}),
            buildListTile(
                Icons.vpn_key, 'Void Relics', Icons.arrow_forward_ios, () {}),
            buildListTile(
                Icons.build, 'Foundry', Icons.arrow_forward_ios, () {}),
            buildListTile(
                Icons.settings, 'Settings', Icons.arrow_forward_ios, () {}),
            buildListTile(Icons.exit_to_app, 'Logout', Icons.arrow_forward_ios,
                () {
              Navigator.of(context).pushReplacementNamed(LogIn.route);
            }),
            // Just the simply and extra info below the drawer
            Container(
              padding: EdgeInsets.symmetric(vertical: 4),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('ps4'.toLowerCase(),
                      style: GoogleFonts.roboto(color: Colors.grey)),
                  Text('4.9.0.3',
                      style: GoogleFonts.roboto(color: Colors.grey)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
