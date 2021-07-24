import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../export/warframe_ui.dart';
import '../../data/datasources/warframe_news_remote_datasource.dart';
import '../../data/models/warframe_news.dart';
import '../widgets/news_card_item.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen();

  static const String route = 'news';

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return SafeArea(
      child: SizedBox(
        height: screen.height,
        width: screen.width,
        child: const _NewsList(),
      ),
    );
  }
}

class _NewsList extends StatelessWidget {
  const _NewsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<WarframeNewsModel>>(
      future: context.read<NewsNetwork>().getRemoteWarframeNews(),
      builder: (
        BuildContext context,
        AsyncSnapshot<List<WarframeNewsModel>> snapshot,
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
          final List<WarframeNewsModel> data = snapshot.data!.toList();
          return WarframeListViewBuilder(
            itemCount: data.length,
            itemBuilder: (_, int i) {
              return NewsCardItem(
                key: ValueKey<int>(i),
                newsItem: data[i],
              );
            },
          );
        }
      },
    );
  }
}
