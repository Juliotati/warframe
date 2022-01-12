part of warframe_news;

class NewsScreen extends StatefulWidget {
  const NewsScreen();

  static const String route = 'news';

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  Future<void> _getNews() async {
    await context.read<NewsProvider>().getNews();
  }

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _getNews();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return SafeArea(
      key: const Key('warframe-news-screen'),
      child: SizedBox(
        height: screen.height,
        width: screen.width,
        child: RefreshIndicator(
          onRefresh: () async {
            await context.read<NewsProvider>().refreshNews();
          },
          child: const _NewsList(),
        ),
      ),
    );
  }
}
