import 'package:flutter/material.dart';
import '../../../../core/presentation/presentation.dart';
import '../../data/models/warframe_model.dart';

class Attributes extends StatelessWidget {
  const Attributes({
    Key? key,
    required this.warframe,
  }) : super(key: key);

  final WarframeModel warframe;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <AttributeItem>[
          AttributeItem(label: 'Health', attribute: warframe.health),
          AttributeItem(label: 'Shield', attribute: warframe.shield),
          AttributeItem(label: 'Armor', attribute: warframe.armor),
          AttributeItem(label: 'Energy', attribute: warframe.power),
          AttributeItem(
            label: 'Sprint',
            attribute: double.parse('${warframe.sprintSpeed}'),
          ),
        ],
      ),
    );
  }
}

class AttributeItem extends StatelessWidget {
  const AttributeItem({
    Key? key,
    required this.label,
    required this.attribute,
  }) : super(key: key);

  final String label;
  final dynamic attribute;

  @override
  Widget build(BuildContext context) {
    return WarframeContainer(
      margin: 3.0,
      color: const Color.fromRGBO(255, 255, 255, 0.4),
      child: Column(
        children: <Widget>[
          Text(
            label.toUpperCase(),
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  color: const Color.fromRGBO(255, 255, 255, 0.7),
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(height: 3.0),
          Text(
            '$attribute',
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  color: const Color.fromRGBO(255, 255, 255, 1.0),
                  fontSize: 11,
                ),
          )
        ],
      ),
    );
  }
}
