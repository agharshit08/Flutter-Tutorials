import 'package:flutter/material.dart';
import 'package:whatsapp_ui/functions/custom_function.dart';
import 'package:whatsapp_ui/screens/home_screen_mobile.dart';
import 'package:whatsapp_ui/screens/home_screen_web.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomFunctions.isMobile(context) ? HomeScreenMobile() : HomeScreenWeb();
  }
}