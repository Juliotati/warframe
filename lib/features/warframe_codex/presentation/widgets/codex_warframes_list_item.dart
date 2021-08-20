part of warframe_codex;

class WarframeListItem extends StatelessWidget {
  const WarframeListItem(
    this.warframe, {
    required Key key,
  }) : super(key: key);

  final WarframeModel warframe;

  void selectedWarframe(BuildContext context) {
    Navigator.of(context).pushNamed(
      WarframeProfile.route,
      arguments: warframe,
    );
  }

  @override
  Widget build(BuildContext context) {
    return StackedContainer(
      showBackground: true,
      key: Key(warframe.uniqueName),
      onTap: () => selectedWarframe(context),
      image: warframe.wikiaThumbnail,
      label: warframe.name.toUpperCase(),
      tag: warframe.uniqueName,
      labelTag: warframe.description,
      maxLines: 2,
    );
  }
}
