import 'package:flutter/material.dart';
import '../../data/models/warframe_abilities_model.dart';
import '../../../../core/presentation/presentation.dart';
import '../../data/models/warframe_model.dart';

class AbilitiesTile extends StatelessWidget {
  const AbilitiesTile({
    Key? key,
    required this.warframe,
  }) : super(key: key);

  final WarframeModel warframe;

  @override
  Widget build(BuildContext context) {
    final List<bool> _bools = <bool>[true,true, false, false, false];
    final List<AbilitiesModel> ability = warframe.abilities;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: ToggleButtons(
        isSelected: _bools,
        children: <Widget>[
          WarframeContainer(
            child: Text(
              'Passive',
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    color: const Color.fromRGBO(0, 0, 0, 1.0),
                    fontSize: 16,
                  ),
            ),
          ), WarframeContainer(
            child: Text(
              ability[0].name,
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    color: const Color.fromRGBO(0, 0, 0, 1.0),
                    fontSize: 16,
                  ),
            ),
          ),
          WarframeContainer(
            child: Text(
              ability[1].name,
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    color: const Color.fromRGBO(0, 0, 0, 1.0),
                    fontSize: 16,
                  ),
            ),
          ),
          WarframeContainer(
            child: Text(
              ability[2].name,
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    color: const Color.fromRGBO(0, 0, 0, 1.0),
                    fontSize: 16,
                  ),
            ),
          ),
          WarframeContainer(
            child: Text(
              ability[3].name,
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    color: const Color.fromRGBO(0, 0, 0, 1.0),
                    fontSize: 16,
                  ),
            ),
          ),
        ],
      ),
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
  final String ability;

  @override
  Widget build(BuildContext context) {
    return WarframeContainer(
      horizontalPadding: 10.0,
      margin: 0.0,
      withShadow: true,
      child: Column(
        children: <Widget>[
          Text(
            abilityName,
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  color: const Color.fromRGBO(0, 0, 0, 1.0),
                  fontSize: 18,
                ),
          ),
          Text(
            ability,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  color: const Color.fromRGBO(0, 0, 0, 1.0),
                ),
            softWrap: true,
          ),
        ],
      ),
    );
  }
}
