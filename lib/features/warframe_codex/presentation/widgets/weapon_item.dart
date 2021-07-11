import '../../../../export/warframe_ui.dart';
import '../../data/models/melee_weapon_model.dart';
import '../../data/models/primary_weapon_model.dart';
import '../../data/models/secondary_weapon_model.dart';

class PrimaryWeaponCard extends StatelessWidget {
  const PrimaryWeaponCard({
    required Key key,
    required this.weapon,
  }) : super(key: key);

  final PrimaryWeaponModel weapon;

  @override
  Widget build(BuildContext context) {
    return StackedContainer(
      key: Key(weapon.uniqueName),
      onTap: null,
      image: weapon.wikiaThumbnail,
      label: weapon.name.toUpperCase(),
      tag: weapon.uniqueName,
      labelTag: weapon.description,
    );
  }
}

class SecondaryWeaponCard extends StatelessWidget {
  const SecondaryWeaponCard({
    required Key key,
    required this.weapon,
  }) : super(key: key);

  final SecondaryWeaponModel weapon;

  @override
  Widget build(BuildContext context) {
    return StackedContainer(
      key: Key(weapon.uniqueName),
      onTap: null,
      image: weapon.wikiaThumbnail,
      label: weapon.name.toUpperCase(),
      tag: weapon.uniqueName,
      labelTag: weapon.description,
    );
  }
}

class MeleeWeaponCard extends StatelessWidget {
  const MeleeWeaponCard({
    required Key key,
    required this.weapon,
  }) : super(key: key);

  final MeleeWeaponModel weapon;

  @override
  Widget build(BuildContext context) {
    return StackedContainer(
      key: Key(weapon.uniqueName),
      onTap: null,
      image: weapon.wikiaThumbnail,
      label: weapon.name.toUpperCase(),
      tag: weapon.uniqueName,
      labelTag: weapon.description,
    );
  }
}
