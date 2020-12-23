import 'package:flutter/material.dart';
import 'package:warframe/modals/codex_modals.dart';

class Attributes extends StatelessWidget {
  const Attributes({
    Key key,
    @required this.selectedWarframe,
  }) : super(key: key);

  final Warframe selectedWarframe;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        AttributeItem(label: 'Health',attribute:selectedWarframe.health),
        AttributeItem(label: 'Shield',attribute:selectedWarframe.shield),
        AttributeItem(label: 'Armor',attribute:selectedWarframe.armor),
        AttributeItem(label: 'Energy',attribute:selectedWarframe.energy),
        AttributeItem(label: 'Sprint',attribute:selectedWarframe.sprint),
      ],
    );
  }
}

class AttributeItem extends StatelessWidget {
  const AttributeItem({
    Key key,
    @required this.label,
    @required this.attribute,
  }) : super(key: key);

  final String label;
  final dynamic attribute;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label.toUpperCase(),
            style:
            Theme.of(context).textTheme.bodyText2),
        SizedBox(
          height: 8,
        ),
        Text('$attribute',
            style:
            Theme.of(context).textTheme.bodyText2)
      ],
    );
  }
}
