part of widgets;

class CodexModsListView extends StatelessWidget {
  const CodexModsListView();

  @override
  Widget build(BuildContext context) {
    return CodexDataScaffold(
      label: 'Mods',
      body: SafeArea(
        child: Consumer<ModsNetwork>(
          builder: (BuildContext context, ModsNetwork _network, _) {
            final List<ModModel> data = _network.data;

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: WarframeListViewBuilder(
                itemCount: data.length,
                itemBuilder: (_, int i) {
                  return ModItems(
                    data[i],
                    key: Key(data[i].name!),
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

class ModItems extends StatelessWidget {
  const ModItems(this.mod, {Key? key}) : super(key: key);
  final ModModel mod;
  @override
  Widget build(BuildContext context) {
    return WarframeContainer(
      child: mod.wikiaThumbnail != null
          ? Image.network(mod.wikiaThumbnail!)
          : Text(
              mod.name!,
              style: const TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1.0),
              ),
            ),
    );
  }
}
