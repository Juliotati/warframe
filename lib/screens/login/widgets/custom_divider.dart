import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 0.5,
            width: 100,
            margin: EdgeInsets.symmetric(horizontal: 10),
            color: Colors.grey[300],
          ),
          Text('or continue with'),
          Container(
            height: 0.5,
            width: 100,
            margin: EdgeInsets.symmetric(horizontal: 10),
            color: Colors.grey[300],
          ),
        ],
      ),
    );
  }
}
