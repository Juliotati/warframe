part of widgets;

class CodexGuns extends StatelessWidget {
  const CodexGuns(this.category, {Key? key}) : super(key: key);

  static const String route = 'codex-guns';
  final String category;
  
  @override
  Widget build(BuildContext context) {
    final List<GunModel> data = context.read<WeaponNetwork>().guns(category);

    return CodexDataScaffold(
      label: category,
      body: data.isEmpty
          ? LoadingIndicator('Loading $category')
          : WarframeListViewBuilder(
              itemCount: data.length,
              itemBuilder: (_, int i) {
                return GunCard(
                  key: Key(data[i].uniqueName),
                  gun: data[i],
                );
              },
            ),
    );
  }
}
