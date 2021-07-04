import 'package:flutter/material.dart';

class DisplayCard extends StatelessWidget {
  const DisplayCard({this.child, this.onTap});

  final Widget? child;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 20.0,
        shadowColor: const Color.fromRGBO(255, 255, 255, 0.1),
        color: const Color.fromRGBO(255, 255, 255, 0.3),
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        child: child,
      ),
    );
  }
}
