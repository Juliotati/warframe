import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../app_data/codex.dart';
import '../widgets/warframe_drawer.dart';
import '../widgets/codex_warframe_grid_item.dart';

// This screen displays all the warframes available in the dummy data file with
// the use of CodexWarframeCat
class CodexWarframesScreen extends StatelessWidget {
  static const route = 'codex_warframe_screen';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawerEdgeDragWidth: 50,
        drawerEnableOpenDragGesture: true,
        drawer: WarframeDrawer(),
        appBar: AppBar(
          title: Center(
            child: Text(
              'Codex'.toUpperCase(),
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
        body: WarframeGrid(),
      ),
    );
  }
}

class WarframeGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final warframeData = Provider.of<CodexWarframes>(context);
    final codexWarframe = warframeData.items;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/ship.jpg'), fit: BoxFit.cover)),
      child: GridView.builder(
          itemCount: codexWarframe.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 4 / 3,
              crossAxisSpacing: 1.0,
              mainAxisSpacing: 0.0),
          itemBuilder: (ctx, i) {
            // Return the CodexWarframeCat widget in a GridView
            return ChangeNotifierProvider.value(
              value: codexWarframe[i],
              child: CodexWarframeGridItem(),
            );
          }),
    );
  }
}
