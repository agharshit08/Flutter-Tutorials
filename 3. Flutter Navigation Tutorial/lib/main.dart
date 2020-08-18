import 'package:flutter/material.dart';
import 'package:tutorial_app/home_screen.dart';
import 'package:tutorial_app/profile_screen.dart';
import 'package:tutorial_app/route_generator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Navigation Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
