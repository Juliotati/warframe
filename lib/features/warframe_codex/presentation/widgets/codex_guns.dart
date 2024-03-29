part of warframe_codex;

class CodexGuns extends StatelessWidget {
  const CodexGuns(
    this.category, {
    Key? key,
  }) : super(key: key);

  static const String route = '/codex-guns';
  final String category;

  @override
  Widget build(BuildContext context) {
    return CodexDataScaffold(
      label: category,
      body: SafeArea(
        child: Consumer<WarframeCodexProvider>(
          builder: (_, WarframeCodexProvider _provider, __) {
            final List<GunModel> data = _provider.guns(category);
            if (data == null) return NoData('$category are not available 😬');
            if (data.isEmpty) return const LoadingIndicator();
            return WarframeGridViewBuilder(
              itemCount: data.length,
              itemBuilder: (_, int i) {
                return GunCard(
                  key: Key(data[i].uniqueName),
                  gun: data[i],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
