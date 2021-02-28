import 'package:flutter/material.dart';
import 'package:warframe/utilities/assets.dart';

class AliasProfile extends StatelessWidget {
  const AliasProfile({
    Key key,
    @required this.alias,
  }) : super(key: key);

  final String alias;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          constraints: const BoxConstraints(maxHeight: 120, minHeight: 110),
          child: Image.network(kAvatar),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(
              alias ?? 'blazertherazer12',
              textAlign: TextAlign.left,
              style: const TextStyle(fontSize: 18),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Column(
                children: const <Text>[
                  Text(
                    '24',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    'GOLD DRAGON',
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
