import 'package:flutter/material.dart';
import 'package:top_10/screens/home_screen.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:top_10/screens/onboarding_screen.dart';

class SplashScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      navigateAfterSeconds: OnboardingScreen(),
      title: Text(
        'BNB Tech!',
        style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
      ),
      image: Image.asset('assets/images/logo.png'),
      photoSize: 100,
    );
  }
}
