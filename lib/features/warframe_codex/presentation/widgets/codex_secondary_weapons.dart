part of widgets;

class CodexSecondaryWeapons extends StatelessWidget {
  const CodexSecondaryWeapons({Key? key}) : super(key: key);

  static const String route = 'codex-secondary-weapons';

  @override
  Widget build(BuildContext context) {
    final List<SecondaryWeaponModel> data = context.watch<WeaponNetwork>().secondary;
    return CodexDataScaffold(
      label: 'Secondary',
      body: data.isEmpty
          ? const LoadingIndicator('Loading Secondary Weapons')
          : WarframeListViewBuilder(
              itemCount: data.length,
              itemBuilder: (_, int i) {
                return SecondaryWeaponCard(
                  key: ValueKey<String>(data[i].uniqueName),
                  secondary: data[i],
                );
              },
            ),
    );
  }
}
