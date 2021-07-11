import 'package:flutter/rendering.dart';

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
    return Stack(
      children: <Widget>[
        WeaponImageBox(weapon.wikiaThumbnail),
        WeaponNameBox(weapon.name),
      ],
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
    return Stack(
      children: <Widget>[
        WeaponImageBox(weapon.wikiaThumbnail),
        WeaponNameBox(weapon.name),
      ],
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
    return Stack(
      children: <Widget>[
        WeaponImageBox(weapon.wikiaThumbnail),
        WeaponNameBox(weapon.name),
      ],
    );
  }
}

class WeaponImageBox extends StatelessWidget {
  const WeaponImageBox(
    this.imageUrl, {
    Key? key,
  }) : super(key: key);

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return WarframeContainer(
      height: 197,
      showImage: true,
      backgroundImage: imageUrl ?? kImagePlaceholder,
      color: const Color.fromRGBO(255, 255, 255, 0.45),
      fit: BoxFit.contain,
    );
  }
}

class WeaponNameBox extends StatelessWidget {
  const WeaponNameBox(
    this.name, {
    Key? key,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: -8.0,
      right: 15.0,
      left: 15.0,
      child: WarframeContainer(
        width: double.infinity,
        child: Text(
          name,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: 18,
                color: const Color.fromRGBO(0, 0, 0, 1.0),
              ),
        ),
      ),
    );
  }
}
