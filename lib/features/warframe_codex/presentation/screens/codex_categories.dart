part of warframe_codex;

class CodexCategories extends StatelessWidget {
  const CodexCategories();

  static const String route = 'codex-categories';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: kCodexCategories.map((CodexCategoryModel category) {
        return CodexCategoryItem(
          category.name,
          icon: category.icon,
        );
      }).toList(),
    );
  }
}
