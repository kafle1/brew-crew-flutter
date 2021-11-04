import 'package:brew_crew/screens/auth/register.dart';
import 'package:brew_crew/screens/auth/signin.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignin = true;

  void toggleView() {
    setState(() {
      showSignin = !showSignin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return showSignin
        ? SignIn(toggleView: toggleView)
        : Register(toggleView: toggleView);
  }
}
