part of warframe_codex;

class CodexCategories extends StatelessWidget {
  const CodexCategories();

  static const String route = '/codex-categories';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WarframeGridViewBuilder(
        key: const ValueKey<String>('warframe-codex-categories-screen'),
        itemCount: kCodexCategories.length,
        desktopMaxCrossAxisExtent: 700,
        desktopMainAxisExtent: 70,
        mobileMainAxisExtent: 50,
        itemBuilder: (_, int i) {
          return CodexCategoryItem(
            key: ValueKey<String>('codex-${kCodexCategories[i].name}-category'),
            icon: kCodexCategories[i].icon,
            category: kCodexCategories[i].name,
          );
        },
      ),
    );
  }
}
