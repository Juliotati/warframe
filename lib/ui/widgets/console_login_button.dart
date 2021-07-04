import 'package:flutter/material.dart';

class ConsoleLoginButton extends StatelessWidget {
  const ConsoleLoginButton({
    Key key,
    @required this.label,
    @required this.color,
    this.onTap,
  }) : super(key: key);

  final String label;
  final Color color;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2),
      width: 350,
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: color),
        borderRadius: const BorderRadius.all(
          Radius.circular(0.0),
        ),
      ),
      child: FlatButton(
        splashColor: color,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        color: color.withOpacity(0.7),
        textColor: Colors.white,
        onPressed: onTap,
        child: Text(label),
      ),
    );
  }
}
