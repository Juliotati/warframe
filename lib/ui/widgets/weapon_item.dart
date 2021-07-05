import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:warframe/modals/weapon_primary.dart';
import 'package:warframe/ui/widgets/warframe_container.dart';

class WeaponCardItem extends StatelessWidget {
  const WeaponCardItem({
    required this.weapon,
  });

  final PrimaryWeapon weapon;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        WarframeContainer(
          height: 197,
          width: double.infinity,
          showImage: true,
          backgroundImage: '${weapon.wikiaThumbnail}',
          color: const Color.fromRGBO(255, 255, 255, 0.4),
        ),
        Positioned(
          bottom: -8.0,
          right: 0.0,
          left: 0.0,
          child: WarframeContainer(
            width: double.infinity,
            child: Text(
              '${weapon.name.toUpperCase()}',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 18,
                    color: const Color.fromRGBO(0, 0, 0, 1.0),
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
