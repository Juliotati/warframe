import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warframe/modals/news.dart';
import 'package:warframe/service/news_http.dart';
import 'package:warframe/utilities/placeholders.dart';
import 'package:warframe/utilities/scaffold.dart';
import 'package:warframe/widgets/news_card_item.dart';

class NewsScreen extends StatefulWidget {
  static const String route = 'news_screen';

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  Future<void> _refresh() async {
    await Provider.of<NewsNetwork>(context, listen: false).getWarframeNews();
    setState(() {});
    return;
  }

  @override
  Widget build(BuildContext context) {
    final NewsNetwork news = Provider.of<NewsNetwork>(context);
    return WarframeScaffold(
      screenName: 'news',
      child: SafeArea(
        child: RefreshIndicator(
          onRefresh: _refresh,
          child: FutureBuilder<List<WarframeNews>>(
            future: news.getWarframeNews(),
            builder:
                (BuildContext context, AsyncSnapshot<List<WarframeNews>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const LoadingIndicator();
              }
              if (snapshot.hasError) {
                return const WarframeError('NO NEWS FOUND');
              } else {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int i) {
                    return NewsCardItem(
                      newsItem: snapshot.data[i],
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
