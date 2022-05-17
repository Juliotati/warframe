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
    return Consumer<WarframeCodexProvider>(
      builder: (BuildContext ctx, WarframeCodexProvider _provider, _) {
        if (_provider.warframes == null) return const LoadingIndicator();

        if (_provider.warframes.isEmpty) {
          return RetryButton(onTap: _provider.getWarframes);
        } else {
          return builder(ctx, _provider.warframes);
        }
      },
    );
  }
}
