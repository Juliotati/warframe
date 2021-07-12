part of widgets;

class CodexMeleeWeapons extends StatelessWidget {
  const CodexMeleeWeapons({
    Key? key,
  }) : super(key: key);

  static const String route = 'codex-melee-weapons';

  @override
  Widget build(BuildContext context) {
    final List<MeleeWeaponModel> data = context.watch<WeaponNetwork>().melee;

    return CodexDataScaffold(
      label: 'Melee',
      body: data.isEmpty
          ? const LoadingIndicator('Loading Melee Weapons')
          : WarframeListViewBuilder(
              itemCount: data.length,
              itemBuilder: (_, int i) {
                return MeleeWeaponCard(
                  key: ValueKey<String>(data[i].uniqueName),
                  weapon: data[i],
                );
              },
            ),
    );
  }
}
