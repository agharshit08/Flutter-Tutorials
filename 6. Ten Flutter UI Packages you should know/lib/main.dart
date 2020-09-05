import 'package:flutter/material.dart';
import 'package:top_10/screens/flushbar_screen.dart';
import 'package:top_10/screens/image_screen.dart';
import 'package:top_10/screens/logger_screen.dart';
import 'package:top_10/screens/lottie_screen.dart';
import 'package:top_10/screens/onboarding_screen.dart';
import 'package:top_10/screens/photo_screen.dart';
import 'package:top_10/screens/progress_screen.dart';
import 'package:top_10/screens/shimmer_screen.dart';
import 'package:top_10/screens/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Top 10 UI Packages!',
      debugShowCheckedModeBanner: false,
      home: ImageScreen(),
    );
  }
}
