import 'package:fitness_app/constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class WeeklyBarChartWidget extends StatelessWidget {
  final List<int> weeklyData;
  final double
      maximumValueOnYAxis; // This is needed because the background or the maximum value on y axis is represente by this.
  WeeklyBarChartWidget({this.weeklyData, this.maximumValueOnYAxis});


  // GREAT WORK WATCHING TILL NOW, JUST LAST PART REMAINING ;)
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: Colors.white,
          elevation: 0,
          child: Container(
            margin: EdgeInsets.only(top: 15.0),
            child: BarChart(
                mainBarData() // All the code for bar chart return from this function!
                ),
          ),
        ),
      ),
    );
  }

  BarChartGroupData makeGroupData(int x, double y) {
    return BarChartGroupData(x: x, barRods: [
      BarChartRodData(
        y: y,
        color: CustomColors.kCyanColor, // Color of the bar which is filled
        width: 15.0,
        backDrawRodData: BackgroundBarChartRodData(
            show: true,
            color: CustomColors.kCyanColor.withOpacity(0.2),
            y: maximumValueOnYAxis // background max value.
            ),
      )
    ]);
  }

  // Complete list of bars returns from here.
  List<BarChartGroupData> showingGroups() {
    return List.generate(weeklyData.length, (index) {
      return makeGroupData(index,
          weeklyData[index].toDouble()); // This function will return the Bar.
    });
  }

  FlTitlesData _buildAxes() {
    return FlTitlesData(
        show: true,
        leftTitles: SideTitles(showTitles: false),
        bottomTitles: SideTitles(
            showTitles: true,
            textStyle: TextStyle(
                color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 14),
            margin: 12, // space from bars starting position
            getTitles: (double value) {
              switch (value.toInt()) {
                case 0:
                  return 'Mon';
                case 1:
                  return 'Tue';
                case 2:
                  return 'Wed';
                case 3:
                  return 'Thu';
                case 4:
                  return 'Fri';
                case 5:
                  return 'Sat';
                case 6:
                  return 'Sun';
                default:
                  return '';
              }
            }));
            // This runs from 0 to length of list. In this case 0 - 6
  }
  
  BarChartData mainBarData() {
    return BarChartData(
      maxY: maximumValueOnYAxis,
      borderData: FlBorderData(
        show: false,
      ),
      groupsSpace: 40,
      titlesData: _buildAxes(), // To build x and y axis.
      alignment: BarChartAlignment.center, // To put it in center
      barGroups: showingGroups(), // This function would draw the actual bars!
    );
  }
}
