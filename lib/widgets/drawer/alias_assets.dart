import 'package:flutter/material.dart';
import 'package:warframe/utilities/assets.dart';

class AliasAssets extends StatelessWidget {
  const AliasAssets({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4),
      color: Colors.grey[900],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              height: 20,
              child: Image.network(kCredit),
            ),
            const Text('$kMoney'),
            const SizedBox(width: 150),
            SizedBox(
              height: 20,
              child: Image.network(kPlatinumImage),
            ),
            const Text('$kPlatinum')
          ],
        ),
      ),
    );
  }
}
