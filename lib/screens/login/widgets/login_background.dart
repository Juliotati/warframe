import 'package:flutter/material.dart';

class LoginBackground extends StatelessWidget {
  LoginBackground({
    this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/scarletspear.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
