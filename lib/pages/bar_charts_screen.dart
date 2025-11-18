import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';



class BarChartsScreen extends StatelessWidget{
  const BarChartsScreen({super.key});


  final double barWidth =22;



  @override
  Widget build(BuildContext context ) => BarChart(
    BarChartData(
      alignment: BarChartAlignment.center,
      maxY: 20,
      minY: _20,
    )
  );
}