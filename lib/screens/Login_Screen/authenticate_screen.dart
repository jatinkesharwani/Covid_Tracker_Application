import 'package:covid19_tracker/screens/Login_Screen/SignInPage.dart';
import 'package:covid19_tracker/screens/Login_Screen/SignUpPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key key}) : super(key: key);

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;

  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignInPage(toggle: toggleView);
    } else {
      return SignUpPage(toggle: toggleView);
    }
  }
}