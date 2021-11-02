import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sigin in to Brew Crew'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        child: ElevatedButton(
          child: Text('Sign in Anonymous'),
          onPressed: () async {
            var result = await _auth.signInAnon();
            if (result != null) {
              print(result.uid);
            } else {
              print('Error signing in');
            }
          },
        ),
      ),
    );
  }
}
