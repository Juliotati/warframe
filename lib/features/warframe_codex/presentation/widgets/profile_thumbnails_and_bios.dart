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
      key: ValueKey<String>(warframe.uniqueName),
      image: warframe.wikiaThumbnail,
      label: warframe.description,
      tag: warframe.uniqueName,
      labelTag: warframe.description,
      fontSize: 14,
      maxLines: 9,
    );
  }
}

class WeaponThumbnailAndBio extends StatelessWidget {
  const WeaponThumbnailAndBio({
    Key? key,
    required this.weapon,
  }) : super(key: key);

  final WeaponModel weapon;

  @override
  Widget build(BuildContext context) {
    final bool isShort = weapon.description.characters.length <= 90;
    final bool isLong = weapon.description.characters.length >= 200;
    return StackedContainer(
      height: 270,
      bottom: isShort ? -20 : isLong ? -60.0 : -50.0,
      isBodyText2: true,
      key: ValueKey<String>(weapon.uniqueName),
      image: weapon.wikiaThumbnail,
      label: weapon.description,
      tag: weapon.uniqueName,
      labelTag: weapon.description,
      fontSize: 14,
      maxLines: 9,
    );
  }
}
