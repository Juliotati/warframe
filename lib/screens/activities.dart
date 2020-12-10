import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/warframe_drawer.dart';

class ActivitiesScreen extends StatefulWidget {
  static const route = 'activities_screen';

  @override
  _ActivitiesScreenState createState() => _ActivitiesScreenState();
}

class _ActivitiesScreenState extends State<ActivitiesScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
//        backgroundColor: Colors.blueGrey,
        drawerEdgeDragWidth: 50,
        drawerEnableOpenDragGesture: true,
        drawer: WarframeDrawer(),
        appBar: AppBar(
          title: Center(
            child: Text(
              'Activities',
              style: GoogleFonts.roboto(fontSize: 24),
            ),
          ),
          actions: [
            Icon(Icons.people),
            SizedBox(width: 8),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(Icons.chat_bubble),
            )
          ],
          backgroundColor: Colors.transparent.withOpacity(0.4),
          bottomOpacity: 80,
        ),
        body: Container(
          height: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/ship.jpg'), fit: BoxFit.cover)),
          child: Center(
            child: Text(
              'Activity',
              style: TextStyle(color: Colors.white, fontSize: 32),
            ),
          ),
        ),
      ),
    );
  }
}
