import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warframe/modals/news.dart';
import 'package:warframe/service/news_network.dart';
import 'package:warframe/ui/utilities/utilities.dart';
import 'package:warframe/ui/widgets/news_card_item.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen();

  static const String route = 'news';


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder<List<WarframeNews>>(
          future: context.read<NewsNetwork>().getWarframeNews(),
          builder: (
            BuildContext context,
            AsyncSnapshot<List<WarframeNews>> snapshot,
          ) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const LoadingIndicator('GETTING NEWS');
            }
            if (!snapshot.hasData) {
              return const WarframeError('NO NEWS AVAILABLE');
            }
            if (snapshot.hasError) {
              return const WarframeError('UNABLE TO LOAD NEWS');
            } else {
              final List<WarframeNews> data = snapshot.data!.toList();
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (_, int i) {
                  return NewsCardItem(
                    newsItem: data[i],
                  );
                },
              );
            }
          }),
    );
  }
}
