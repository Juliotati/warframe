import 'package:flutter/material.dart';
import './activities.dart';

class LogIn extends StatefulWidget {
  static const route = 'login';

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  GlobalKey _formKey = GlobalKey<FormState>();

  String alias;

  // void logIn() {
  //   final valid = _formKey;
  //   if () {
  //     return;
  //   } else {
  //     Navigator.pushNamed(
  //       context,
  //       ActivitiesScreen.route,
  //       arguments: alias,
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/scarletspear.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 350,
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Colors.blueGrey.withOpacity(0.1),
                        hintText: 'ALIAS',
                        hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
                      ),
                      style: Theme.of(context).textTheme.headline5,
                      cursorWidth: 5,
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
                ],
              ),
              color: Colors.blueGrey[800],
            ),
            GamePlatformButton(
                label: 'LOGIN', color: Colors.black, alias: alias),
            SizedBox(height: 10),
            CustomDivider(),
            SizedBox(height: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GamePlatformButton(
                  label: 'PS4',
                  color: Colors.lightBlue[800],
                  alias: alias,
                ),
                GamePlatformButton(
                  label: 'XBOX ONE',
                  color: Colors.green[700],
                  alias: alias,
                ),
                GamePlatformButton(
                  label: 'Nitendo Switch',
                  color: Colors.red,
                  alias: alias,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 0.5,
          width: 118,
          margin: EdgeInsets.symmetric(horizontal: 10),
          color: Colors.grey[300],
        ),
        Text('or continue with'),
        Container(
          height: 0.5,
          width: 118,
          margin: EdgeInsets.symmetric(horizontal: 10),
          color: Colors.grey[300],
        ),
      ],
    );
  }
}

class GamePlatformButton extends StatelessWidget {
  const GamePlatformButton({
    Key key,
    @required this.label,
    @required this.alias,
    @required this.color,
     this.onTap,
  }) : super(key: key);

  final String label, alias;
  final Color color;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2),
      width: 350,
      decoration: BoxDecoration(border: Border.all(width: 2, color: color)),
      child: FlatButton(
        splashColor: color,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        color: color.withOpacity(0.7),
        textColor: Colors.white,
        child: Text(label),
        onPressed: () => Navigator.pushNamed(
        context,
        ActivitiesScreen.route,
        arguments: alias,
      ),
      ),
    );
  }
}
