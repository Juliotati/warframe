import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/user/Desktop/Development/Others/warframe/lib/screens/news.dart';
import 'package:warframe/widgets/login_background.dart';
import 'package:warframe/widgets/login_body.dart';

class LogIn extends StatefulWidget {
  static const String route = 'login';

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final GlobalKey _formKey = GlobalKey<FormState>();

  String alias;

  void login() {
    const bool _isValid = true;
    if (!_isValid) {
      return;
    } else {
      Navigator.pushNamed(
        context,
        NewsScreen.route,
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
              onChanged: (String value) {
                setState(() {
                  alias = value;
                });
              },
              onSaved: (String value) {
                if (value.isEmpty) {
                  return 'Please enter your alias name';
                }
                if (value.length <= 2) {
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

final InputDecoration loginFormDecoration = InputDecoration(
  border: InputBorder.none,
  filled: true,
  fillColor: Colors.blueGrey.withOpacity(0.1),
  hintText: 'ALIAS',
  hintStyle: const TextStyle(fontSize: 20, color: Colors.grey),
);
