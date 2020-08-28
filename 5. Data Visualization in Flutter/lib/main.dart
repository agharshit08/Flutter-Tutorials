import 'package:data_visualization/bar_chart.dart';
import 'package:data_visualization/bar_chart_two.dart';
import 'package:data_visualization/line_chart.dart';
import 'package:data_visualization/pie_chart.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: Center(
          child: BarChartOne(),
        ),
      )
    );
  }
}
