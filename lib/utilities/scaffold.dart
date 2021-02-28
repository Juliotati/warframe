import 'package:flutter/material.dart';
import 'package:warframe/widgets/drawer/warframe_drawer.dart';

class WarframeScaffold extends StatelessWidget {
  const WarframeScaffold({
    @required this.screenName,
    this.child,
  });

  final Widget child;
  final String screenName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEdgeDragWidth: 50,
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      drawer: const WarframeDrawer(),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(screenName.toUpperCase()),
        actions: <IconButton>[
          IconButton(icon: const Icon(Icons.group), onPressed: () {}),
          IconButton(icon: const Icon(Icons.chat_bubble), onPressed: () {}),
        ],
      ),
      body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage('images/ship.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(child: child)),
    );
  }
}
