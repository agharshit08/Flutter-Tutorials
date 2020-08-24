import 'package:flutter/material.dart';

class CustomFunctions {
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 1200;
  }
}