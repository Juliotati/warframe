part of widgets;

class CodexGridItem extends StatelessWidget {
  const CodexGridItem(this.warframe, {Key? key}) : super(key: key);

  final WarframeModel warframe;

  void selectedWarframe(BuildContext context) {
    Navigator.of(context).pushNamed(
      WarframeProfile.route,
      arguments: warframe.name,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectedWarframe(context),
      child: GridTile(
        footer: SizedBox(
          height: 30,
          child: GridTileBar(
            title: Text(
              warframe.name.toUpperCase(),
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    color: Colors.black,
                  ),
            ),
            backgroundColor: Colors.white,
          ),
        ),
        child: Card(
          color: const Color.fromRGBO(255, 255, 255, 0.65),
          margin: const EdgeInsets.all(0),
          child: Image.network(
            warframe.wikiaThumbnail ?? kImagePlaceholder,
            errorBuilder: (_, __, ___) {
              if (kIsWeb) {
                return const Icon(
                  Icons.image_not_supported_outlined,
                  size: 60.0,
                );
              } else {
                return Image.network(kImagePlaceholder);
              }
            },
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
