import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';

import '../models/LineChartModel.dart';
import '../main.dart';

class CustomLineChart extends StatelessWidget {
  const CustomLineChart({super.key, required this.points});

  final List<LineChartModel> points;


  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(10.0),
      child: AspectRatio(
        aspectRatio: 2,
        child: LineChart(
            LineChartData(
              borderData: FlBorderData(
                  border: const Border()),


              titlesData: const  FlTitlesData(
                  topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false)
                  ),

                  rightTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: false,
                      )
                  ),

                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 56,
                        interval: 2

                    ),
                    axisNameSize: 30,
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 56,
                        interval: 5

                    ),
                  )
              ),


              gridData:FlGridData(
                  drawHorizontalLine: true,
                  drawVerticalLine: false,
                  horizontalInterval:2,
                  getDrawingHorizontalLine: (_)=>const FlLine(
                      color:primaryColor,
                      strokeWidth: 1
                  )
              ) ,

              lineBarsData: [
                LineChartBarData(
                  barWidth: 4,
                  color:primaryColor,
                  spots:
                  points.map((point) => FlSpot(point.x, point.y)).toList(),
                  isCurved: true,
                  dotData: const FlDotData(show: true),
                ),
              ],



            )
        ),
      ),
    );
  }
}
