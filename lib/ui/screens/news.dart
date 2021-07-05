import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warframe/modals/news.dart';
import 'package:warframe/service/news_network.dart';
import 'package:warframe/ui/utilities/utilities.dart';
import 'package:warframe/ui/widgets/news_card_item.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen();

  static const String route = 'news';

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final NewsHelper helper = context.read<NewsHelper>();
    return WarframeScaffold(
      screenName: 'news',
      isLoader: true,
      onTap: () => helper._refresh(context),
      child: SafeArea(
        child: RefreshIndicator(
          onRefresh: () => helper._refresh(context),
          color: const Color.fromRGBO(154, 154, 154, 1.0),
          backgroundColor: const Color.fromRGBO(0, 0, 0, 0.8),
          child: FutureBuilder<List<WarframeNews>>(
            future: context.read<NewsNetwork>().getWarframeNews(),
            builder: (
              BuildContext context,
              AsyncSnapshot<List<WarframeNews>> snapshot,
            ) {
              return NewsBuilderBody(
                snapshot,
                body: AnimatedList(
                  key: helper._key,
                  initialItemCount: helper.news.length,
                  itemBuilder: (_, int i, Animation<double> animation) {
                    helper.index = i;
                    final Animatable<Offset> _offset = Tween<Offset>(
                      begin: const Offset(0, 1),
                      end: const Offset(0, 0),
                    )..animate(
                        CurvedAnimation(
                          curve: Curves.easeOut,
                          parent: animation,
                        ),
                      );
                    return SlideTransition(
                      position: animation.drive(_offset),
                      child: NewsCardItem(
                        newsItem: helper.news[i],
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class NewsBuilderBody extends StatelessWidget {
  const NewsBuilderBody(
    this.snapshot, {
    Key? key,
    required this.body,
  }) : super(key: key);

  final AsyncSnapshot<List<WarframeNews>> snapshot;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const LoadingIndicator('GETTING NEWS');
    }
    if (!snapshot.hasData) {
      return const WarframeError('NO NEWS AVAILABLE');
    }
    if (snapshot.hasError) {
      return const WarframeError('UNABLE TO LOAD NEWS');
    } else {
      context.read<NewsHelper>().animateList(snapshot.data?.reversed.toList());
      return body;
    }
  }
}

class NewsHelper with ChangeNotifier {
  final GlobalKey<AnimatedListState> _key = GlobalKey<AnimatedListState>();

  List<WarframeNews> news = <WarframeNews>[];

  Future<void> _refresh(BuildContext context) async {
    news = <WarframeNews>[];
    context.read<NewsNetwork>().getWarframeNews();
    notifyListeners();
  }

  int index = 0;

  Future<void> _stagger = Future<void>(() {});

  Future<void> animateList(List<WarframeNews>? newsList) async {
    int _duration = 90;
    const int _insertionDuration = 10;

    for (final WarframeNews item in newsList!) {
      _duration = _duration + 50;

      if (newsList.isEmpty) return;

      debugPrint('$_duration');

      _stagger = _stagger.then((_) {
        return Future<void>.delayed(Duration(milliseconds: _duration), () {
          news.add(item);
          _key.currentState?.insertItem(
            index,
            duration: const Duration(milliseconds: _insertionDuration),
          );
        });
      });
    }
  }
}
