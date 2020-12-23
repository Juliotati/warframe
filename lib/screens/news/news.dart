import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warframe/service/news.dart';
import 'package:warframe/screens/news/news_card_item.dart';
import 'package:warframe/utilities/scaffold.dart';


class NewsScreen extends StatelessWidget {
  static const route = 'news_screen';

  @override
  Widget build(BuildContext context) {
    final newsData = Provider.of<News>(context).cards;
    return WarframeScaffold(
      screenName: 'news',
      child:  ListView.builder(
            itemCount: newsData.length,
            itemBuilder: (ctx, i) {
              return ChangeNotifierProvider.value(
                value: newsData[i],
                child: NewsCardItem(),
              );
            },
          ),
        );
  }
}
