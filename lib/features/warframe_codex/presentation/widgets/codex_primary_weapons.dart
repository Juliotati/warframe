part of widgets;

class CodexPrimaryWeapons extends StatelessWidget {
  const CodexPrimaryWeapons({Key? key}) : super(key: key);

  static const String route = 'codex-primary-weapons';

  @override
  Widget build(BuildContext context) {
    final List<PrimaryWeaponModel> data = context.watch<WeaponNetwork>().primary;

    return CodexDataScaffold(
      label: 'Primary',
      body: data.isEmpty
          ? const LoadingIndicator('Loading Primary Weapons')
          : WarframeListViewBuilder(
              itemCount: data.length,
              itemBuilder: (_, int i) {
                return PrimaryWeaponCard(
                  key: ValueKey<String>(data[i].uniqueName),
                  primary: data[i],
                );
              },
            ),
    );
  }
}
