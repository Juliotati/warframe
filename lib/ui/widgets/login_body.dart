import 'package:flutter/material.dart';
import 'package:warframe/ui/widgets/console_login_button.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({
    required this.form,
    this.onTap,
  });

  final Form form;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          width: 340,
          child: form,
        ),
        ConsoleLoginButton(
          label: 'LOGIN',
          color: Colors.black,
          onTap: onTap,
        ),
        const Text('or continue with'),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <ConsoleLoginButton>[
            ConsoleLoginButton(
              label: 'PS4',
              color: Colors.lightBlue[800],
              onTap: onTap,
            ),
            ConsoleLoginButton(
              label: 'XBOX ONE',
              color: Colors.green[700],
              onTap: onTap,
            ),
            ConsoleLoginButton(
              label: 'Nitendo Switch',
              color: Colors.red,
              onTap: onTap,
            ),
          ],
        ),
      ],
    );
  }
}
