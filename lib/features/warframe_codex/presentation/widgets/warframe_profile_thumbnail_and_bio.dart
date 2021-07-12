part of widgets;

class WarframeThumbnailAndBio extends StatelessWidget {
  const WarframeThumbnailAndBio({
    Key? key,
    required this.warframe,
  }) : super(key: key);

  final WarframeModel warframe;

  @override
  Widget build(BuildContext context) {
    return StackedContainer(
      height: 360,
      bottom: -40.0,
      isBodyText2: true,
      key: Key(warframe.uniqueName),
      image: warframe.wikiaThumbnail,
      label: warframe.description,
      tag: warframe.uniqueName,
      labelTag: warframe.description,
      fontSize: 14,
      maxLines: 9,
    );
  }
}
