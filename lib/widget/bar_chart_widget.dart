
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter1/data/bar_data.dart';

class BarChartWidget extends StatelessWidget {

  const BarChartWidget({super.key});

  final double barWidth =22;




  @override
  Widget build(BuildContext context ) => BarChart(
      BarChartData(
        alignment: BarChartAlignment.center,
        maxY: 20,
        minY: -20,
        groupsSpace: 12,
        barTouchData: BarTouchData(enabled: true),
        barGroups: BarDataSet.barData.map(
              (data) {
            return BarChartGroupData(
              x: data.id,
              barRods: [
                BarChartRodData(
                  toY: data.y,
                  width: barWidth,
                  color: data.color,
                  borderRadius: BorderRadius.circular(4),
                ),
              ],
            );
          },
        ).toList(),
      )
  );
}