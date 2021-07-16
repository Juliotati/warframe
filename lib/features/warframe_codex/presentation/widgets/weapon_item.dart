part of widgets;

class PrimaryWeaponCard extends StatelessWidget {
  const PrimaryWeaponCard({
    required Key key,
    required this.primary,
  }) : super(key: key);

  final PrimaryWeaponModel primary;

  Future<void> selectPrimary(BuildContext context) async {
    Navigator.of(context).push(
      MaterialPageRoute<WeaponProfile>(
        builder: (BuildContext contetxt) {
          return WeaponProfile.primary(
            primary: primary,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StackedContainer(
      onTap: () => selectPrimary(context),
      key: Key(primary.uniqueName),
      image: primary.wikiaThumbnail,
      label: primary.name.toUpperCase(),
      tag: primary.uniqueName,
      labelTag: primary.description,
    );
  }
}

class SecondaryWeaponCard extends StatelessWidget {
  const SecondaryWeaponCard({
    required Key key,
    required this.secondary,
  }) : super(key: key);

  final SecondaryWeaponModel secondary;

  Future<void> selectSecondary(BuildContext context) async {
    Navigator.of(context).push(
      MaterialPageRoute<WeaponProfile>(
        builder: (BuildContext contetxt) {
          return WeaponProfile.secondary(secondary: secondary);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StackedContainer(
      onTap: () => selectSecondary(context),
      key: Key(secondary.uniqueName),
      image: secondary.wikiaThumbnail,
      label: secondary.name.toUpperCase(),
      tag: secondary.uniqueName,
      labelTag: secondary.description,
    );
  }
}

class MeleeWeaponCard extends StatelessWidget {
  const MeleeWeaponCard({
    required Key key,
    required this.melee,
  }) : super(key: key);

  final MeleeWeaponModel melee;

  Future<void> selectMelee(BuildContext context) async {
    Navigator.of(context).push(
      MaterialPageRoute<WeaponProfile>(
        builder: (BuildContext contetxt) {
          return WeaponProfile.melee(melee: melee);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StackedContainer(
      onTap: () => selectMelee(context),
      key: Key(melee.uniqueName),
      image: melee.wikiaThumbnail,
      label: melee.name.toUpperCase(),
      tag: melee.uniqueName,
      labelTag: melee.description,
    );
  }
}
