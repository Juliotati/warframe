import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warframe/app_data/news.dart';
import 'package:url_launcher/url_launcher.dart';

// This widget build the card that display news and news image.
class NewsCardItem extends StatelessWidget {
//  final String title;
//  final String image;
//  final String webPage;
//
//  NewsCardItem(this.title, this.image, this.webPage);

  @override
  Widget build(BuildContext context) {
    final newsCard = Provider.of<NewsCard>(context);
// This launches the url associated with the news report card.
    launchWebPage() async {
      if (await canLaunch(newsCard.webPage)) {
        launch(newsCard.webPage);
      }
    }

    return InkWell(
      onTap: launchWebPage,
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
        child: Column(
          children: [
            Container(
              height: 195,
              width: double.infinity,
              child: Image.network(
                newsCard.image,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6),
              child: Text(
                newsCard.title.toUpperCase(),
                style: Theme.of(context).textTheme.bodyText1,
                maxLines: 1,
              ),
              height: 30,
              width: double.infinity,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
