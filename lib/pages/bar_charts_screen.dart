import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter1/widget/bar_chart_widget.dart';



class BarChartsScreen extends StatelessWidget{
  const BarChartsScreen({super.key});



  @override
  Widget build(BuildContext context) => Card(
   elevation: 4,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(32),
    ),
    color: const Color(0xff020227),
    child: Padding(
      padding: const EdgeInsets.only(top: 16),
      child: BarChartWidget(),
    ),
  );
}