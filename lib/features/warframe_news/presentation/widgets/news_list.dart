part of warframe_news;

class _NewsList extends StatelessWidget {
  const _NewsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _NewsBuilder(
      key: const Key('_NewsBuilder'),
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
  const _NewsBuilder({required this.builder, super.key});

  final Widget Function(BuildContext, List<NewsModel>) builder;

  @override
  Widget build(BuildContext context) {
    return Consumer<NewsProvider>(
      builder: (_, NewsProvider _provider, __) {
        if (_provider.state == ProviderState.loading) {
          return const LoadingIndicator();
        }
        if (_provider.state == ProviderState.idle) {
          return RetryButton(
            message: 'Reload to update',
            buttonLabel: 'Reload',
            onTap: () => _provider.refreshNews(),
          );
        }
        if (_provider.state != ProviderState.loaded) {
          return RetryButton(onTap: () => _provider.refreshNews());
        } else {
          final List<NewsModel> data = _provider.news!;
          return builder(context, data);
        }
      },
    );
  }
}
