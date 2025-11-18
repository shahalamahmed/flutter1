
import 'package:flutter/material.dart';

class BarChartsScreen extends StatelessWidget {
  const BarChartsScreen({super.key});


  @override
  Widget build(BuildContext context){
   return SafeArea(
     child: Scaffold(
       body: SfCartesianChart(),
     ));
  }
  List<GDPData> getChartData(){}
  final List<GDPData> chartData = [
    GDPData("Oceania", 1600),
    GDPData("Africa", 2490),
    GDPData("S America", 2900),
    GDPData("Europe", 23050),
    GDPData("N America", 24880),
    GDPData("Asia", 34390),

  ];
}

class GDPData {
  GDPData(this.continent, this.gdp);
  final String continent;
  final double gdp;
}