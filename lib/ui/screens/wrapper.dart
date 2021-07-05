import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warframe/export/warframe_ui.dart';

class WarframeWrapper extends StatelessWidget {
  const WarframeWrapper();

  static const String route = 'main';
  @override
  Widget build(BuildContext context) {
    final LayoutHelper layout = context.watch<LayoutHelper>();
    final bool isNewsScreen = layout.screen == Screen.news;

    return Scaffold(
      drawerEdgeDragWidth: 50,
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      drawer: const WarframeDrawer(),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(layout.label.toUpperCase()),
        actions: <WarframeContainer>[
          const WarframeContainer(
            height: 35,
            width: 35,
            margin: 10.0,
            color: Color.fromRGBO(255, 255, 255, 0.4),
            centerChild: true,
            horizontalPadding: 0.0,
            verticalPadding: 0.0,
            child: Icon(Icons.group),
          ),
          WarframeContainer(
            height: 35,
            width: 35,
            margin: 10.0,
            color: const Color.fromRGBO(255, 255, 255, 0.4),
            centerChild: true,
            horizontalPadding: 0.0,
            verticalPadding: 0.0,
            // onTap: onTap,
            child: Icon(isNewsScreen ? Icons.refresh : Icons.chat_bubble),
          ),
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
        child: Center(
          child: layout.currentScreen(),
        ),
      ),
    );
  }
}

enum Screen {
  activities,
  news,
  codex,
  inventory,
  companions,
  arsenal,
  voidRelics,
  foundry,
  settings,
}

class LayoutHelper with ChangeNotifier {
  Screen screen = Screen.news;
  String label = 'News';

  void updateScreen(Screen screen, String label) {
    this.screen = screen;
    this.label = label;
    notifyListeners();
  }

  Widget currentScreen() {
    if (screen == Screen.codex) {
      return const CodexCategories();
    } else {
      return const NewsScreen();
    }
  }
}
