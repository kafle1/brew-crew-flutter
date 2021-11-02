import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('Home'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: [
            TextButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              label: Text(
                'Logout',
                style: TextStyle(color: Colors.white),
              ),
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
