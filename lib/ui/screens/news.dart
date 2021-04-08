import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warframe/modals/news.dart';
import 'package:warframe/service/news_network.dart';
import 'package:warframe/ui/utilities/placeholders.dart';
import 'package:warframe/ui/utilities/scaffold.dart';
import 'package:warframe/ui/widgets/news_card_item.dart';

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
      isLoader: true,
      onTap: _refresh,
      child: SafeArea(
        child: RefreshIndicator(
          onRefresh: _refresh,
          child: FutureBuilder<List<WarframeNews>>(
            future: news.getWarframeNews(),
            builder: (BuildContext context,
                AsyncSnapshot<List<WarframeNews>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const LoadingIndicator('GETTING NEWS');
              }
              if (snapshot.hasError) {
                return const WarframeError('NO NEWS FOUND');
              } else {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int i) {
                    return NewsCardItem(
                      newsItem: snapshot.data.reversed.toList()[i],
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
