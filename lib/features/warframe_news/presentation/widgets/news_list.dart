part of warframe_news;

class _NewsList extends StatelessWidget {
  const _NewsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _NewsConsumer(
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

class _NewsConsumer extends StatelessWidget {
  const _NewsConsumer({
    Key? key,
    required this.builder,
  }) : super(key: key);

  final Widget Function(BuildContext, List<NewsModel>) builder;

  @override
  Widget build(BuildContext context) {
    return Consumer<NewsRemoteDatasourceImpl>(
      builder: (BuildContext context, NewsRemoteDatasourceImpl snapshot, __) {
        if (snapshot.state == NewsState.loading) {
          return const LoadingIndicator();
        }
        if (snapshot.state == NewsState.empty) {
          return RetryButton(onTap: () => snapshot.refreshNews());
        } else {
          final List<NewsModel> data = snapshot.data!.toList();
          return builder(context, data);
        }
      },
    );
  }
}
