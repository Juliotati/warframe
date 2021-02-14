import 'package:flutter/material.dart';

import '../assets.dart';

class AliasAssets extends StatelessWidget {
  const AliasAssets({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(child: Image.network('$kCredit'), height: 20),
            Text('$kMoney'),
            SizedBox(width: 150),
            Container(child: Image.network('$kPlatinumImage'), height: 20),
            Text('$kPlatinum')
          ],
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 4),
      color: Colors.grey[900],
    );
  }
}
