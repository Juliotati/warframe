import 'package:flutter/material.dart' show BuildContext, Color, ScaffoldMessenger, SnackBar, Text, TextStyle;

Future<void> warframeSuccessSnackBar(
  BuildContext context,
  String label, {
  int duration = 4,
}) async {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        label,
        style: const TextStyle(
          fontSize: 15,
          color: Color.fromRGBO(255, 255, 255, 1.0),
        ),
      ),
      duration: Duration(seconds: duration),
      backgroundColor: const Color.fromRGBO(38, 202, 133, 0.95),
    ),
  );
}

Future<void> warframeErrorSnackBar(
  BuildContext context,
  String label, {
  int duration = 4,
}) async {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        label,
        style: const TextStyle(
          fontSize: 15,
          color: Color.fromRGBO(255, 255, 255, 1.0),
        ),
      ),
      duration: Duration(seconds: duration),
      backgroundColor: const Color.fromRGBO(239, 83, 80, 0.95),
    ),
  );
}
