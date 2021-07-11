import 'package:flutter/material.dart';

import '../../../../core/presentation/presentation.dart';
import '../../data/models/warframe_abilities_model.dart';
import '../../data/models/warframe_model.dart';

class AbilitiesTile extends StatefulWidget {
  const AbilitiesTile({
    Key? key,
    required this.warframe,
  }) : super(key: key);

  final WarframeModel warframe;

  @override
  _AbilitiesTileState createState() => _AbilitiesTileState();
}

class _AbilitiesTileState extends State<AbilitiesTile> {
  int selectedAbility = 0;
  final List<AbilitiesModel> ability = <AbilitiesModel>[];

  void toggleAbility(int index) {
    setState(() => selectedAbility = index);
  }

  Future<void> addPassiveAbility() async {
    final AbilitiesModel passiveAbility = AbilitiesModel(
      name: 'Passive',
      description: widget.warframe.passiveDescription ?? 'No Passive',
    );
    if (!widget.warframe.abilities.contains(passiveAbility)) {
      widget.warframe.abilities.insert(0, passiveAbility);
    }
    ability.addAll(widget.warframe.abilities);
  }

  @override
  void initState() {
    addPassiveAbility();
    selectedAbility = widget.warframe.passiveDescription != null ? 0 : 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        Positioned(
          bottom: -90.0,
          right: 0.0,
          left: 0.0,
          child: WarframeContainer(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                widget.warframe.abilities[selectedAbility].description,
                softWrap: true,
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: const Color.fromRGBO(0, 0, 0, 1.0),
                      fontSize: 16,
                    ),
              ),
            ),
          ),
        ),
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: <Widget>[
              WarframeContainer(
                onTap: () => toggleAbility(0),
                withShadow: selectedAbility == 0 ? true : false,
                child: Text(
                  ability[0].name,
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: const Color.fromRGBO(0, 0, 0, 1.0),
                        fontSize: 16,
                      ),
                ),
              ),
              WarframeContainer(
                onTap: () => toggleAbility(1),
                withShadow: selectedAbility == 1 ? true : false,
                child: Text(
                  ability[1].name,
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: const Color.fromRGBO(0, 0, 0, 1.0),
                        fontSize: 16,
                      ),
                ),
              ),
              WarframeContainer(
                onTap: () => toggleAbility(2),
                withShadow: selectedAbility == 2 ? true : false,
                child: Text(
                  ability[2].name,
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: const Color.fromRGBO(0, 0, 0, 1.0),
                        fontSize: 16,
                      ),
                ),
              ),
              WarframeContainer(
                onTap: () => toggleAbility(3),
                withShadow: selectedAbility == 3 ? true : false,
                child: Text(
                  ability[3].name,
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: const Color.fromRGBO(0, 0, 0, 1.0),
                        fontSize: 16,
                      ),
                ),
              ),
              WarframeContainer(
                onTap: () => toggleAbility(4),
                withShadow: selectedAbility == 4 ? true : false,
                child: Text(
                  ability[4].name,
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: const Color.fromRGBO(0, 0, 0, 1.0),
                        fontSize: 16,
                      ),
                ),
              ),
            ],
          ),
        ),
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
