import 'package:flutter/material.dart';
import 'package:warframe/modals/warframe.dart';

class Attributes extends StatelessWidget {
  const Attributes({
    Key? key,
    required this.warframe,
  }) : super(key: key);

  final Warframe warframe;

  @override
  Widget build(BuildContext context) {
    return Row(
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
    return Column(
      children: <Widget>[
        Text(label.toUpperCase(), style: Theme.of(context).textTheme.bodyText2),
        const SizedBox(height: 8),
        Text('$attribute', style: Theme.of(context).textTheme.bodyText2)
      ],
    );
  }
}
