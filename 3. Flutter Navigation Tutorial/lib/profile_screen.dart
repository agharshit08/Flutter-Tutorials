import 'package:flutter/material.dart';

class User {
  String name;
  User(this.name);
}

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile';
  final String user;
  ProfileScreen(this.user);
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go Back'),
            ),
            Text(
              'Profile Screen:' + user ,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
