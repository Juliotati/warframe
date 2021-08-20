part of warframe_codex;

class GunCard extends StatelessWidget {
  const GunCard({
    required Key key,
    required this.gun,
  }) : super(key: key);

  final GunModel gun;

  Future<void> selectGun(BuildContext context) async {
    Navigator.of(context).push(
      MaterialPageRoute<WeaponProfile>(
        builder: (BuildContext contetxt) {
          return WeaponProfile.gun(
            gun: gun,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StackedContainer(
      onTap: () => selectGun(context),
      key: Key(gun.uniqueName),
      image: gun.wikiaThumbnail,
      label: gun.name.toUpperCase(),
      tag: gun.uniqueName,
      labelTag: gun.description,
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
