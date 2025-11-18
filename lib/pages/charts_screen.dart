

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
class ChartsScreen extends StatelessWidget {
  const ChartsScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dummy Data Pie Chart and Bar Chart')),
      body: Center(
        child: SizedBox(
          width: 200,
          height: 200,
          child: PieChart(
            PieChartData(
              sections:[
                PieChartSectionData(
                  color: Colors.blue,
                  value: 32,
                  title: 'Category A (32%)',
                  radius: 50,
                  titleStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                PieChartSectionData(
                  color: Colors.green,
                  value: 40,
                  title: 'Category B (40%)',
                  radius: 50,
                  titleStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                PieChartSectionData(
                  color: Colors.red,
                  value: 20,
                  title: 'Category C (20%)',
                  radius: 50,
                  titleStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ],
              borderData: FlBorderData(show: false),
              sectionsSpace:2,
              centerSpaceRadius:40,
            ),
          ),
        ),
      ),
    );
  }
}