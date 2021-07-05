import 'package:flutter/material.dart';
import 'package:warframe/ui/utilities/utilities.dart';

class AliasProfile extends StatelessWidget {
  const AliasProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          constraints: const BoxConstraints(maxHeight: 140, minHeight: 120),
          child: Image.network(kAvatar),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            const Text(
              'blazertherazer12',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 18),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Text>[
                  const Text(
                    '24',
                    style: TextStyle(fontSize: 24),
                  ),
                  Text(
                    'GOLD DRAGON',
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(fontSize: 14),
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
