import 'package:flutter/material.dart';
import 'package:warframe/modals/codex_modals.dart';

class Abilities extends StatelessWidget {
  const Abilities({
    Key key,
    @required this.selectedWarframe,
  }) : super(key: key);

  final Warframe selectedWarframe;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text('Abilities'.toUpperCase(),
          style: Theme.of(context).textTheme.headline5),
      trailing: Icon(
        Icons.drag_handle,
        color: Colors.grey,
      ),
      children: [
        Column(
          children: [
            AbilityItem(abilityName: selectedWarframe.abilityOneName, ability: selectedWarframe.abilityOne,),
            AbilityItem(abilityName: selectedWarframe.abilityTwoName, ability: selectedWarframe.abilityTwo,),
            AbilityItem(abilityName: selectedWarframe.abilityThreeName, ability: selectedWarframe.abilityThree,),
            AbilityItem(abilityName: selectedWarframe.abilityFourName, ability: selectedWarframe.abilityFour,),
            AbilityItem(abilityName: selectedWarframe.passive, ability: selectedWarframe.passiveBio,),
          ],
        )
      ],
    );
  }
}

class AbilityItem extends StatelessWidget {
  const AbilityItem({
    Key key,
    @required this.ability,
    @required this.abilityName,
  }) : super(key: key);

  final String abilityName;
  final String ability;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
          abilityName
              .toUpperCase(),
          style: Theme.of(context)
              .textTheme
              .bodyText2
              .copyWith(
              fontWeight: FontWeight.bold)),
      subtitle: Text(
          ability,
          style: Theme.of(context)
              .textTheme
              .bodyText2),
    );
  }
}
