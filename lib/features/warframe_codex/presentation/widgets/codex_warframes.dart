part of warframe_codex;

class CodexWarframesListView extends StatelessWidget {
  const CodexWarframesListView();

  @override
  Widget build(BuildContext context) {
    return CodexDataScaffold(
      label: 'Warframes',
      body: SafeArea(
        child: Consumer<WarframeNetwork>(
          builder: (BuildContext context, WarframeNetwork _network, _) {
            final List<WarframeModel> data = _network.data;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: WarframeListViewBuilder(
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
