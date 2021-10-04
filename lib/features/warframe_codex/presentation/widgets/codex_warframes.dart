part of warframe_codex;

class _CodexWarframeList extends StatelessWidget {
  const _CodexWarframeList();

  @override
  Widget build(BuildContext context) {
    return CodexDataScaffold(
      label: 'Warframes',
      body: SafeArea(
        child: _WarframeConsumer(
          builder: (BuildContext context, List<WarframeModel> data) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: WarframeGridViewBuilder(
                itemCount: data.length,
                itemBuilder: (_, int i) {
                  return WarframeListItem(
                    data[i],
                    key: Key(data[i].uniqueName),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class _WarframeConsumer extends StatelessWidget {
  const _WarframeConsumer({
    Key? key,
    required this.builder,
  }) : super(key: key);

  final Widget Function(BuildContext, List<WarframeModel>) builder;

  @override
  Widget build(BuildContext context) {
    return Consumer<WarframeRemoteDatasourceImpl>(
      builder: (BuildContext ctx, WarframeRemoteDatasourceImpl snapshot, _) {
        if (snapshot.state == WarframeState.loading) {
          return const LoadingIndicator();
        }
        if (snapshot.state == WarframeState.empty) {
          return RetryButton(onTap: () => snapshot.refresh());
        } else {
          final List<WarframeModel> data = snapshot.data!.toList();
          return builder(ctx, data);
        }
      },
    );
  }
}
