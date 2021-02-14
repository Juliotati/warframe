import 'package:flutter/material.dart';

import '../assets.dart';

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
      children: [

        Container(
          constraints: BoxConstraints(maxHeight: 120, minHeight: 110),
          child: Image.network('$kAvatar'),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Text(alias ?? 'blazertherazer12',
              textAlign: TextAlign.left, style: TextStyle(fontSize: 18)),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Column(
            children: [
              Text('24', style: TextStyle(fontSize: 24)),
              Text(
                'GOLD DRAGON',
              )
            ],
          ),
        )
      ],
    );
  }
}
