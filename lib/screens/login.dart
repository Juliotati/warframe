import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './activities.dart';
import './news.dart';

// This is the login widget that shows when the user opens the app
class LogIn extends StatefulWidget {
  static const route = 'login';

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  String alias;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
              child: Column(
                children: [
                  // Input field where you can enter your game name/Alias
                  TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.blueGrey[700],
                      hintText: 'ALIAS',
                      hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                    style: Theme.of(context).textTheme.headline5,
                    cursorWidth: 5,
                    cursorColor: Colors.grey,
                    onChanged: (value) {
                      alias = value;
                    },
                    keyboardType: TextInputType.emailAddress,
                  ),
                  FlatButton(
                    color: Colors.white,
                    child: Text(
                      'LOGIN',
                      style: GoogleFonts.roboto(fontSize: 26),
                    ),
                    onPressed: () => Navigator.pushNamed(
                        context, ActivitiesScreen.route,
                        arguments: {'alias': alias}),
                  ),
                ],
              ),
              color: Colors.blueGrey[800],
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // log in with playstation 4
                  FlatButton(
                      child: Text('PS4'),
                      color: Colors.lightBlue[900],
                      onPressed: () => Navigator.pushNamed(
                          context, NewsScreen.route,
                          arguments: {alias})),
                  SizedBox(
                    width: 5,
                  ),
                  // log in with your ex
                  FlatButton(
                      color: Colors.green[900],
                      child: Text('XBOX ONE'),
                      onPressed: () => Navigator.pushNamed(
                          context, ActivitiesScreen.route,
                          arguments: {alias})),
                  SizedBox(
                    width: 5,
                  ),
                  // log in with the neat tendo
                  FlatButton(
                      color: Colors.red,
                      child: Column(
                        children: [
                          Text('NINTENDO'),
                          Text('SWITCH'),
                        ],
                      ),
                      onPressed: () => Navigator.pushNamed(
                          context, ActivitiesScreen.route,
                          arguments: {alias})),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
