import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:warframe/modals/news.dart';

class NewsCardItem extends StatelessWidget {
  const NewsCardItem({
    this.newsItem,
  });

  final WarframeNews newsItem;

  Future<void> launchWebPage() async {
    if (await canLaunch(newsItem.link)) {
      launch(newsItem.link);
    }
    return;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: launchWebPage,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 195,
              width: double.infinity,
              child: Image.network(
                newsItem.imageLink,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6),
              height: 30,
              width: double.infinity,
              child: Text(
                newsItem.message.toUpperCase(),
                style: Theme.of(context).textTheme.bodyText1,
                maxLines: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
