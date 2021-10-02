part of warframe_codex;

class CodexCategoryItem extends StatelessWidget {
  const CodexCategoryItem({
    Key? key,
    required this.category,
    required this.icon,
  }) : super(key: key);

  final String category;
  final IconData icon;

  void navigateToDataScreen(BuildContext context) {
    Navigator.pushNamed(
      context,
      CodexCategoryData.route,
      arguments: category,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size _screen = MediaQuery.of(context).size;
    return SizedBox(
      key: key,
      height: 55,
      width: _screen.width,
      child: Row(
        children: <Widget>[
          const SizedBox(width: 10.0),
          WarframeContainer(
            onTap: () => navigateToDataScreen(context),
            horizontalMargin: 4.0,
            verticalMargin: 4.0,
            width: 50.0,
            centerChild: true,
            horizontalPadding: 0.0,
            verticalPadding: 0.0,
            color: const Color.fromRGBO(255, 255, 255, 0.75),
            child: Icon(
              icon,
              color: const Color.fromRGBO(158, 158, 158, 1.0),
            ),
          ),
          const SizedBox(width: 8.0),
          WarframeContainer(
            onTap: () => navigateToDataScreen(context),
            width: _screen.width * 0.7,
            withShadow: true,
            horizontalMargin: 4.0,
            verticalMargin: 4.0,
            child: Text(
              category,
              style: Theme.of(context).textTheme.headline5!.copyWith(
                    color: const Color.fromRGBO(0, 0, 0, 1.0),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
