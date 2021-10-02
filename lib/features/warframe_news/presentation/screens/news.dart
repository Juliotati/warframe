part of warframe_news;

class NewsScreen extends StatelessWidget {
  const NewsScreen();

  static const String route = 'news';

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return SafeArea(
      key: const ValueKey<String>('warframe-news-screen'),
      child: SizedBox(
        height: screen.height,
        width: screen.width,
        child: RefreshIndicator(
            onRefresh: () async {
              await context.read<WarframeNewsRemoteDatasourceImpl>().refresh();
            },
            child: const _NewsList()),
      ),
    );
  }
}
