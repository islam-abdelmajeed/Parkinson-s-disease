import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:graduation_project/logic/home/home_provider.dart';

class LiveLineChart extends StatefulWidget {
  const LiveLineChart({super.key});

  @override
  State<LiveLineChart> createState() => _LiveLineChartState();
}

class _LiveLineChartState extends State<LiveLineChart> {
  List<_ChartData>? chartData;
  late int count;
  ChartSeriesController<_ChartData, int>? _chartSeriesController;

  @override
  void dispose() {
    chartData!.clear();
    _chartSeriesController = null;
    super.dispose();
  }

  @override
  void initState() {
    count = 0;
    chartData = <_ChartData>[];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeProvider, child) {
        if (homeProvider.chartNumbers.isNotEmpty) {
          _updateDataSource(homeProvider.chartNumbers.last);
        }
        return _buildLiveLineChart();
      },
    );
  }

  Widget _buildLiveLineChart() {
    return SizedBox(
      height: 200,
      child: SfCartesianChart(
        plotAreaBorderWidth: 1,
        plotAreaBorderColor: Colors.transparent,
        borderColor: Colors.transparent,
        primaryXAxis: const NumericAxis(majorGridLines: MajorGridLines(width: 0)),
        primaryYAxis: const NumericAxis(
          axisLine: AxisLine(width: 0),
          majorTickLines: MajorTickLines(size: 0),
        ),
        series: <LineSeries<_ChartData, int>>[
          LineSeries<_ChartData, int>(
            onRendererCreated: (ChartSeriesController<_ChartData, int> controller) {
              _chartSeriesController = controller;
            },
            dataSource: chartData!,
            color: const Color(0xffC2DEFF),
            xValueMapper: (_ChartData data, _) => data.time,
            yValueMapper: (_ChartData data, _) => data.value,
            animationDuration: 500,
          ),
        ],
      ),
    );
  }

  void _updateDataSource(num newValue) {
    chartData!.add(_ChartData(count, newValue));
    if (chartData!.length == 20) {
      chartData!.removeAt(0);
      _chartSeriesController?.updateDataSource(
        addedDataIndexes: <int>[chartData!.length - 1],
        removedDataIndexes: <int>[0],
      );
    } else {
      _chartSeriesController?.updateDataSource(
        addedDataIndexes: <int>[chartData!.length - 1],
      );
    }
    count = count + 1;
  }
}

class _ChartData {
  _ChartData(this.time, this.value);
  final int time;
  final num value;
}
