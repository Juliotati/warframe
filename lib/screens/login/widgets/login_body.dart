import 'package:flutter/material.dart';

import 'console_login_button.dart';

class LoginBody extends StatelessWidget {
  LoginBody({
    this.form,
    this.alias,
    this.onTap,
  });

  final Form form;
  final String alias;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: 340,
          child: form,
        ),
        ConsoleLoginButton(
          label: 'LOGIN',
          color: Colors.black,
          alias: alias,
          onTap: onTap,
        ),
        Text('or continue with'),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ConsoleLoginButton(
              label: 'PS4',
              color: Colors.lightBlue[800],
              alias: alias,
              onTap: onTap,
            ),
            ConsoleLoginButton(
              label: 'XBOX ONE',
              color: Colors.green[700],
              alias: alias,
              onTap: onTap,
            ),
            ConsoleLoginButton(
              label: 'Nitendo Switch',
              color: Colors.red,
              alias: alias,
              onTap: onTap,
            ),
          ],
        ),
      ],
    );
  }
}
