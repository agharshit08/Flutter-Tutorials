import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class LoggerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Logger logger = Logger();
    logger.v("Verbose log");
    logger.d("Debug log");
    logger.i("Info log");
    logger.w("Warning log");
    logger.e("Error log");
    logger.wtf("What a terrible failure log");
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Log like a pro!'),
      ),
    );
  }
}
