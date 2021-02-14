import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:warframe/screens/activities.dart';

import 'widgets/login_background.dart';
import 'widgets/login_body.dart';

class LogIn extends StatefulWidget {
  static const route = 'login';

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final GlobalKey _formKey = GlobalKey<FormState>();

  String alias;

  void login() {
    final bool _isValid = true;
    if (!_isValid) {
      return;
    } else {
      Navigator.pushNamed(
        context,
        ActivitiesScreen.route,
        arguments: alias,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginBackground(
        child: LoginBody(
          alias: alias,
          form: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: TextFormField(
              decoration: loginFormDecoration,
              style: Theme.of(context).textTheme.headline5,
              cursorWidth: 5,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              cursorColor: Colors.grey,
              onChanged: (value) {
                setState(() {
                  alias = value;
                });
              },
              onSaved: (value) {
                if (value.characters.length <= 0) {
                  return 'Please enter your alias name';
                }
                if (value.characters.length <= 2) {
                  return 'Your alias is too short';
                } else {
                  return null;
                }
              },
              keyboardType: TextInputType.text,
            ),
          ),
          onTap: login,
        ),
      ),
    );
  }
}

final loginFormDecoration = InputDecoration(
  border: InputBorder.none,
  filled: true,
  fillColor: Colors.blueGrey.withOpacity(0.1),
  hintText: 'ALIAS',
  hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
);