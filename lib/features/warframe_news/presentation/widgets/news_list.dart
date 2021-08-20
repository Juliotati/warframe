part of warframe_news;

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
