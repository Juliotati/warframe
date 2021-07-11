import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../export/warframe_ui.dart';
import '../../data/datasources/news_network.dart';
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
        child: Column(
          children: <Widget>[
            _NewsFilter(key: key),
            _NewsList(key: key),
          ],
        ),
      ),
    );
  }
}

class _NewsFilter extends StatefulWidget {
  const _NewsFilter({Key? key}) : super(key: key);

  @override
  __NewsFilterState createState() => __NewsFilterState();
}

class __NewsFilterState extends State<_NewsFilter> {
  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return WarframeContainer(
      height: 50.0,
      verticalPadding: 0.0,
      horizontalPadding: 0.0,
      width: screen.width,
      color: const Color.fromRGBO(255, 255, 255, 0.4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const <_NewsFilterLabel>[
          _NewsFilterLabel('News'),
          _NewsFilterLabel('Community'),
        ],
      ),
    );
  }
}

class _NewsFilterLabel extends StatefulWidget {
  const _NewsFilterLabel(
    this.label, {
    Key? key,
  }) : super(key: key);

  final String label;

  @override
  __NewsFilterLabelState createState() => __NewsFilterLabelState();
}

class __NewsFilterLabelState extends State<_NewsFilterLabel> {
  bool isNews = true;
  bool isCommunity = false;

  void _toggleFilter() {
    if (isNews) {
      isCommunity = false;
      setState(() => isNews != isNews);
    } else {
      isNews = false;
      setState(() => isCommunity != isCommunity);
    }
    setState(() => isNews != isNews);
  }

  TextStyle? _style() {
    if (isNews || isCommunity) {
      return Theme.of(context).textTheme.headline5;
    } else {
      return Theme.of(context).textTheme.headline5!.copyWith(
            color: const Color.fromRGBO(255, 255, 255, 0.5),
            fontSize: 14,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => _toggleFilter(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            widget.label,
            style: _style(),
          ),
          AnimatedContainer(
            height: (isNews || isCommunity) ? 3.0 : 0.0,
            width: screen.width * 0.3,
            color: const Color.fromRGBO(133, 199, 192, 1.0),
            duration: const Duration(
              milliseconds: 300,
            ),
          ),
        ],
      ),
    );
  }
}

class _NewsList extends StatelessWidget {
  const _NewsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder<List<WarframeNewsModel>>(
        future: context.read<NewsNetwork>().getWarframeNews(),
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
      ),
    );
  }
}
