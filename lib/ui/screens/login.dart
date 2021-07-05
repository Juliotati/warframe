import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:warframe/export/warframe_ui.dart';
import 'package:provider/provider.dart';
import 'package:warframe/ui/screens/wrapper.dart';
import 'package:warframe/ui/widgets/login_background.dart';
import 'package:warframe/ui/widgets/login_body.dart';

class LogIn extends StatefulWidget {
  const LogIn();

  static const String route = 'login';

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? alias;

  Future<void> login(BuildContext context) async {
    final bool isValid = _formKey.currentState!.validate();

    if (!isValid) return;
    Navigator.pushNamed(context, WarframeWrapper.route, arguments: alias);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginBackground(
        child: LoginBody(
          onTap: () => login(context),
          form: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: TextFormField(
              decoration: loginFormDecoration,
              style: Theme.of(context).textTheme.headline5,
              cursorWidth: 5,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              cursorColor: Colors.grey,
              validator: (String? value) {
                if (value!.isEmpty) return 'Please enter your alias name';

                if (value.length <= 2) return 'Your alias is too short';

                return null;
              },
              onSaved: (String? value) => alias = value,
              keyboardType: TextInputType.text,
            ),
          ),
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
