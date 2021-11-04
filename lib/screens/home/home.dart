import 'package:brew_crew/models/brew.dart';
import 'package:brew_crew/screens/home/brew_list.dart';
import 'package:brew_crew/screens/home/settings_form.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:brew_crew/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: SettingsForm(),
            );
          });
    }

    return Container(
      child: StreamProvider<List<Brew>?>.value(
        value: DatabaseService().brews,
        initialData: null,
        child: Scaffold(
          backgroundColor: Colors.brown[50],
          appBar: AppBar(
            title: Text('Brew Crew'),
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
              ),
              TextButton.icon(
                onPressed: () => _showSettingsPanel(),
                label: Text(
                  'Settings',
                  style: TextStyle(color: Colors.white),
                ),
                icon: Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
              )
            ],
          ),
          body: BrewList(),
        ),
      ),
    );
  }
}
