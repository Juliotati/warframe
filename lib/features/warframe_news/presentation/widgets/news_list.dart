part of warframe_news;

class _NewsList extends StatelessWidget {
  const _NewsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _NewsBuilder(
      builder: (BuildContext context, List<NewsModel> data) {
        return WarframeGridViewBuilder(
          itemCount: data.length,
          itemBuilder: (_, int i) {
            return NewsCardItem(
              key: ValueKey<String>(data[i].id),
              newsItem: data[i],
            );
          },
        );
      },
    );
  }
}

class _NewsBuilder extends StatelessWidget {
  const _NewsBuilder({
    Key? key,
    required this.builder,
  }) : super(key: key);

  final Widget Function(BuildContext, List<NewsModel>) builder;

  @override
  Widget build(BuildContext context) {
    final NewsProvider _provider = context.read<NewsProvider>();
    return FutureBuilder<List<NewsModel>?>(
      future: _provider.getNews(),
      builder: (_, AsyncSnapshot<List<NewsModel>?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingIndicator();
        }
        if (!snapshot.hasData || snapshot.data == null || snapshot.hasError) {
          return RetryButton(onTap: () => _provider.refreshNews());
        } else {
          final List<NewsModel> data = snapshot.data!.toList();
          return builder(context, data);
        }
      },
    );
  }
}
