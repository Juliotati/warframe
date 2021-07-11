import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../export/warframe_ui.dart';
import '../../data/models/warframe_news.dart';

class NewsCardItem extends StatelessWidget {
  const NewsCardItem({
    Key? key,
    required this.newsItem,
  }) : super(key: key);

  final WarframeNewsModel newsItem;

  Future<void> launchWebPage() async {
    if (await canLaunch(newsItem.link)) {
      launch(newsItem.link);
    }
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: key,
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          WarframeContainer(
            onTap: launchWebPage,
            withShadow: true,
            height: 197,
            margin: 0.0,
            width: double.infinity,
            color: const Color.fromRGBO(109, 109, 109, 1.0),
            showImage: true,
            backgroundImage: newsItem.imageLink,
          ),
          Positioned(
            bottom: -8.0,
            left: 0.0,
            right: 0.0,
            child: WarframeContainer(
              onTap: launchWebPage,
              margin: 0.0,
              withShadow: true,
              width: double.infinity,
              child: Text(
                newsItem.message.toUpperCase(),
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 13,
                      color: const Color.fromRGBO(0, 0, 0, 1.0),
                    ),
                maxLines: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
