import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:warframe/modals/weapon_primary.dart';
import 'package:warframe/ui/utilities/placeholders.dart';

import 'display_card.dart';

class WeaponCardItem extends StatelessWidget {
  const WeaponCardItem({
    required this.weapon,
  });

  final PrimaryWeapon weapon;

  @override
  Widget build(BuildContext context) {
    return DisplayCard(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 197,
            width: double.infinity,
            child: Image.network(
              '${weapon.wikiaThumbnail ?? kImagePlaceholder}',
              errorBuilder: (BuildContext context, Object object, _) {
                return Image.network(kImagePlaceholder);
              },
              fit: BoxFit.contain,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6),
            height: 35,
            width: double.infinity,
            child: Text(
              '${weapon.name.toUpperCase()}',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 18,
                  ),
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}
