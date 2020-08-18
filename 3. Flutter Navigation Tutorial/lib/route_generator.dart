import 'package:flutter/material.dart';
import 'package:tutorial_app/error_screen.dart';
import 'package:tutorial_app/home_screen.dart';
import 'package:tutorial_app/profile_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(
        builder: (context) => HomeScreen(title: 'Navigation and Routing'),
      );
    } else if (settings.name == ProfileScreen.routeName) {
      final User user = settings.arguments;
      return MaterialPageRoute(
        builder: (context) => ProfileScreen(user.name),
      );
    }
    return MaterialPageRoute(
      builder: (context) => ErrorScreen(),
    );
  }
}
