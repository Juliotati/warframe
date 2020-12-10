import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../app_data/news.dart';
import '../widgets/news_card_item.dart';
import '../widgets/warframe_drawer.dart';

class NewsScreen extends StatelessWidget {
  static const route = 'news_screen';
  @override
  Widget build(BuildContext context) {
    final newsData = Provider.of<News>(context);
    final newsCard = newsData.cards;
    return SafeArea(
      child: Scaffold(
        drawerEdgeDragWidth: 50,
        drawerEnableOpenDragGesture: true,
        drawer: WarframeDrawer(),
        appBar: AppBar(
          title: Center(
            child: Text(
              'News'.toUpperCase(),
              style: GoogleFonts.roboto(fontSize: 24),
            ),
          ),
          actions: [
            Icon(Icons.people),
            SizedBox(width: 8),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Icon(Icons.chat_bubble),
            )
          ],
          backgroundColor: Colors.transparent.withOpacity(0.8),
        ),
        body: Container(
          height: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/ship.jpg'), fit: BoxFit.cover)),
          child: ListView.builder(
            itemCount: newsCard.length,
            itemBuilder: (ctx, i) {
//              ChangeNotifier variable;
              return ChangeNotifierProvider.value(
                value: newsCard[i],
//                create: (ctx) => newsCard[i],
                child: NewsCardItem(),
              );
            },
          ),
        ),
      ),
    );
  }
}
