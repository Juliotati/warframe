part of warframe_codex;

class CodexMeleeWeapons extends StatelessWidget {
  const CodexMeleeWeapons({
    Key? key,
  }) : super(key: key);

  static const String route = 'codex-melee-weapons';

  @override
  Widget build(BuildContext context) {
    return CodexDataScaffold(
      label: 'Melee',
      body: SafeArea(
        child: Consumer<WeaponNetwork>(
          builder: (BuildContext context, WeaponNetwork _network, _) {
            final List<MeleeWeaponModel> data = _network.melee;
            if (data.isEmpty) return const LoadingIndicator();
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: WarframeGridViewBuilder(
                itemCount: data.length,
                itemBuilder: (_, int i) {
                  return MeleeWeaponCard(
                    key: Key(data[i].uniqueName),
                    melee: data[i],
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
