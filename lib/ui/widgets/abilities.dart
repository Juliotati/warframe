import 'package:flutter/material.dart';
import 'package:warframe/modals/warframe.dart';

class AbilitiesTile extends StatelessWidget {
  const AbilitiesTile({
    Key? key,
    required this.warframe,
  }) : super(key: key);

  final Warframe warframe;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text('Abilities'.toUpperCase(),
          style: Theme.of(context).textTheme.headline5),
      trailing: const Icon(
        Icons.drag_handle,
        color: Colors.grey,
      ),
      children: <Column>[
        Column(
          children: <AbilityItem>[
            AbilityItem(
              abilityName: warframe.abilities[0].name,
              ability: warframe.abilities[0].description,
            ),
            AbilityItem(
              abilityName: warframe.abilities[1].name,
              ability: warframe.abilities[1].description,
            ),
            AbilityItem(
              abilityName: warframe.abilities[2].name,
              ability: warframe.abilities[2].description,
            ),
            AbilityItem(
              abilityName: warframe.abilities[3].name,
              ability: warframe.abilities[3].description,
            ),
            if (warframe.passiveDescription != null)
              AbilityItem(
                abilityName: 'Passive',
                ability: warframe.passiveDescription,
              ),
          ],
        )
      ],
    );
  }
}

class AbilityItem extends StatelessWidget {
  const AbilityItem({
    Key? key,
    required this.ability,
    required this.abilityName,
  }) : super(key: key);

  final String abilityName;
  final String? ability;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        abilityName.toUpperCase(),
        style: Theme.of(context)
            .textTheme
            .bodyText2!
            .copyWith(fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        ability!,
        style: Theme.of(context)
            .textTheme
            .bodyText2!
            .copyWith(fontWeight: FontWeight.w300),
      ),
    );
  }
}
