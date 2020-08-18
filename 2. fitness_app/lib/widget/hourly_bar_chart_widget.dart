import 'package:fitness_app/constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class HourlyBarChartWidget extends StatelessWidget {
  final List<int> hourlyData;
  final double
      maximumValueOnYAxis; // This is needed because the background or the maximum value on y axis is represente by this.
  HourlyBarChartWidget({this.hourlyData, this.maximumValueOnYAxis});


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
        color: CustomColors.kLightPinkColor, // Color of the bar which is filled
        width: 7.0,
      )
    ]);
  }

  // Complete list of bars returns from here.
  List<BarChartGroupData> showingGroups() {
    return List.generate(hourlyData.length, (index) {
      return makeGroupData(index,
          hourlyData[index].toDouble()); // This function will return the Bar.
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
                case 1:
                  return '12 AM';
                case 6:
                  return '6 AM';
                case 11:
                  return '12 PM';
                case 16:
                  return '6 PM';
                case 22:
                  return '11 PM';
                default:
                  return '';
              }
            }));
            // This runs from 0 to length of list. In this case 0 - 23
  }

  BarChartData mainBarData() {
    return BarChartData(
      maxY: maximumValueOnYAxis,
      borderData: FlBorderData(
        show: false,
      ),
      groupsSpace: 7.5,
      titlesData: _buildAxes(), // To build x and y axis.
      alignment: BarChartAlignment.center, // To put it in center
      barGroups: showingGroups(), // This function would draw the actual bars!
    );
  }
}

// YES IT IS THAT EASY TO MAKE GRAPH IF YOU UNDERSTAND CODE OF ONE