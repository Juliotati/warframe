part of warframe_news;

class _NewsList extends StatelessWidget {
  const _NewsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<WarframeNewsRemoteDatasourceImpl>(
      builder:
          (BuildContext context, WarframeNewsRemoteDatasourceImpl snapshot, _) {
        if (snapshot.state == NewsState.loading) {
          return const LoadingIndicator('LOADING NEWS');
        }
        if (snapshot.state == NewsState.empty) {
          return const WarframeError('THERE ARE NO NEWS AVAILABLE');
        } else {
          final List<WarframeNewsModel> data = snapshot.data!.toList();
          return WarframeGridViewBuilder(
            itemCount: data.length,
            itemBuilder: (_, int i) {
              return NewsCardItem(
                key: ValueKey<String>(data[i].id),
                newsItem: data[i],
              );
            },
          );
        }
      },
    );
  }
}
