part of warframe_codex;

class CodexCategories extends StatelessWidget {
  const CodexCategories();

  static const String route = '/codex-categories';

  @override
  Widget build(BuildContext context) {
    return Column(
      key: const ValueKey<String>('warframe-codex-categories-screen'),
      mainAxisAlignment: MainAxisAlignment.center,
      children: kCodexCategories.map((CodexCategoryModel category) {
        return CodexCategoryItem(
          key: ValueKey<String>('codex-${category.name}-category'),
          category:category.name,
          icon: category.icon,
        );
      }).toList(),
    );
  }
}
