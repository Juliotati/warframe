import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 0.5,
            width: 100,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            color: Colors.grey[300],
          ),
          const Text('or continue with'),
          Container(
            height: 0.5,
            width: 100,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            color: Colors.grey[300],
          ),
        ],
      ),
    );
  }
}
