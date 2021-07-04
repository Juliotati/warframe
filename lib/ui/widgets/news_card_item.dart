import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:warframe/modals/news.dart';

import 'display_card.dart';

class NewsCardItem extends StatelessWidget {
  const NewsCardItem({
    required this.newsItem,
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
    return DisplayCard(
      onTap: launchWebPage,
      child: Column(
          children: <Widget>[
            SizedBox(
              height: 197,
              width: double.infinity,
              child: Image.network(
                newsItem.imageLink,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6),
              height: 35,
              width: double.infinity,
              child: Text(
                newsItem.message.toUpperCase(),
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 18,
                    ),
                maxLines: 1,
              ),
            ),
          ],
        ),
    );
  }
}

