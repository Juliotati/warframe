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

class ModItems extends StatelessWidget {
  const ModItems(this.mod, {Key? key}) : super(key: key);
  final ModModel mod;

  Future<dynamic> showThumbnail(BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    return showModal(
      context: context,
      builder: (_) => Image.network(
        mod.wikiaThumbnail!,
        height: 200,
      ),
    );
  }

  void noPreviewAvailable(BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 20.0,
        backgroundColor: const Color.fromRGBO(12, 12, 12, 1.0),
        behavior: SnackBarBehavior.floating,
        content: Text(
          'Preview not available for ${mod.name}',
          style: const TextStyle(
            color: Color.fromRGBO(255, 255, 255, 1.0),
          ),
        ),
      ),
    );
  }

  Color rarityColor() {
    if (mod.rarity == 'Rare') return const Color.fromRGBO(201, 157, 59, 1.0);
    if (mod.rarity == 'Uncommon') return const Color.fromRGBO(178, 180, 182, 1.0);
    if (mod.rarity == 'Common') return const Color.fromRGBO(156, 96, 52, 1.0);

   return const Color.fromRGBO(156, 96, 52, 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return WarframeContainer(
      onTap: () => mod.wikiaThumbnail != null
          ? showThumbnail(context)
          : noPreviewAvailable(context),
      verticalMargin: 4.0,
      child: Row(
        children: <Widget>[
          WarframeContainer(
            verticalMargin: 0.0,
            verticalPadding: 0.0,
            horizontalPadding: 0.0,
            horizontalMargin: 0.0,
            width: 8,
            height: 20,
            color: rarityColor(),
          ),
          const SizedBox(width: 7.0),
          Expanded(
            child: Text(
              mod.name,
              style: const TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
