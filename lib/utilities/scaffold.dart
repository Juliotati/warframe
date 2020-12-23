import 'package:flutter/material.dart';
import 'package:warframe/widgets/warframe_drawer.dart';

class WarframeScaffold extends StatelessWidget {
  WarframeScaffold({
    @required this.screenName,
    this.child,
  });

  final Widget child;
  final String screenName;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawerEdgeDragWidth: 50,
        extendBody: true,
        extendBodyBehindAppBar: true,
        drawerEnableOpenDragGesture: true,
        backgroundColor: Colors.transparent,
        drawer: WarframeDrawer(),
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: Text(screenName.toUpperCase()),
          actions: [
            IconButton(icon: Icon(Icons.group), onPressed: () {}),
            IconButton(icon: Icon(Icons.chat_bubble), onPressed: () {}),
          ],
        ),
        body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage('images/ship.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(child: child)),
      ),
    );
  }
}
