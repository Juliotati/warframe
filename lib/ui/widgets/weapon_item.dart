import 'package:flutter/material.dart';
import 'package:warframe/modals/weapon_primary.dart';
import 'package:warframe/ui/utilities/placeholders.dart';

class WeaponCardItem extends StatelessWidget {
  const WeaponCardItem({
    this.weapon,
  });

  final PrimaryWeapon weapon;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 195,
            width: double.infinity,
            child: Image.network(
              weapon.wikiaThumbnail ?? kImagePlaceholder,
              errorBuilder: (BuildContext context, Object object, _) {
                return Image.network(kImagePlaceholder);
              },
              fit: BoxFit.contain,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6),
            height: 30,
            width: double.infinity,
            child: Text(
              weapon.name.toUpperCase(),
              style: Theme.of(context).textTheme.bodyText1,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}
