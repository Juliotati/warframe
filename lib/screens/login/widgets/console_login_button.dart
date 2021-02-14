import 'package:flutter/material.dart';

class ConsoleLoginButton extends StatelessWidget {
  const ConsoleLoginButton({
    Key key,
    @required this.label,
    @required this.alias,
    @required this.color,
    this.onTap,
  }) : super(key: key);

  final String label, alias;
  final Color color;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2),
      width: 350,
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: color),
        borderRadius: BorderRadius.all(
          Radius.circular(0.0),
        ),
      ),
      child: FlatButton(
        splashColor: color,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        color: color.withOpacity(0.7),
        textColor: Colors.white,
        child: Text(label),
        onPressed: onTap,
      ),
    );
  }
}