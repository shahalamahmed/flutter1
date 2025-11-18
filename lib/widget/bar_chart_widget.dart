
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter1/data/bar_data.dart';

class BarChartWidget extends StatelessWidget {
  final double barWidth =22;
  const BarChartWidget({super.key});






  @override
  Widget build(BuildContext context ) => BarChart(
      BarChartData(
        alignment: BarChartAlignment.center,
        maxY: 26,
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

                  borderRadius: data.y > 0
                      ? BorderRadius.only(
                    topLeft: Radius.circular(6),
                    topRight: Radius.circular(6)
                  )

                  : BorderRadius.only(
                    bottomLeft: Radius.circular(6),
                    bottomRight: Radius.circular(6),
                  ),

                ),
              ],
            );
          },
        ).toList(),
      )
  );
}