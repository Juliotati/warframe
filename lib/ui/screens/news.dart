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

class _NewsScreenState extends State<NewsScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey<AnimatedListState> _key = GlobalKey<AnimatedListState>();
  final ScrollController controller = ScrollController();

  List<WarframeNews> news = <WarframeNews>[];

  Future<void> _refresh() async {
    setState(() {
      news = <WarframeNews>[];
    });
    await Provider.of<NewsNetwork>(context, listen: false).getWarframeNews();
    return;
  }

  int index = 0;
  bool done = false;

  Future<void> _stagger = Future<void>(() {});

  Future<void> animateList([List<WarframeNews> data]) async {
    if (done) {
      data?.forEach((WarframeNews wn) {
        _stagger = _stagger.then((_) {
          return Future<void>.delayed(const Duration(milliseconds: 8), () {
            news?.add(wn);
            _key?.currentState?.insertItem(index);
          });
        });
      });
    }
  }

  @override
  void reassemble() {
    super.reassemble();
    news = <WarframeNews>[];
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      animateList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final NewsNetwork _news = Provider.of<NewsNetwork>(context, listen: false);
    return WarframeScaffold(
      screenName: 'news',
      isLoader: true,
      onTap: _refresh,
      child: SafeArea(
        child: RefreshIndicator(
          onRefresh: _refresh,
          color: const Color.fromRGBO(154, 154, 154, 1.0),
          backgroundColor: const Color.fromRGBO(0, 0, 0, 0.8),
          child: FutureBuilder<List<WarframeNews>>(
            future: _news.getWarframeNews(),
            builder: (BuildContext context,
                AsyncSnapshot<List<WarframeNews>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const LoadingIndicator('GETTING NEWS');
              }
              if (snapshot.hasError) {
                return const WarframeError('UNABLE TO LOAD NEWS');
              } else {
                done = true;
                animateList(snapshot?.data?.reversed?.toList());
                return AnimatedList(
                  key: _key,
                  initialItemCount: news.length,
                  itemBuilder: (
                    BuildContext context,
                    int i,
                    Animation<double> animation,
                  ) {
                    index = i;
                    final Animatable<Offset> _offset = Tween<Offset>(
                      begin: const Offset(0, 1),
                      end: const Offset(0, 0),
                    )..animate(
                        CurvedAnimation(
                          curve: Curves.easeInCubic,
                          parent: animation,
                        ),
                      );
                    return SlideTransition(
                      position: animation.drive(_offset),
                      child: ScaleTransition(
                        scale: animation.drive(
                          Tween<double>(begin: 0.8, end: 1.0),
                        ),
                        child: NewsCardItem(
                          newsItem: news[i],
                        ),
                      ),
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
