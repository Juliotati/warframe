import 'package:flutter/widgets.dart' show ChangeNotifier, Widget;
import 'package:warframe/features/warframe_codex/warframe_codex.dart';
import 'package:warframe/features/warframe_news/warframe_news.dart';

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
