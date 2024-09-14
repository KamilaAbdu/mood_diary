import 'package:flutter/material.dart';
import 'package:mood_diary/features/data/models/chart_data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class MoodPieChart extends StatelessWidget {
  final List<ChartData> data;

  const MoodPieChart({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      series: <PieSeries<ChartData, String>>[
        PieSeries<ChartData, String>(
          dataSource: data,
          xValueMapper: (ChartData data, _) => data.label, // Используем label
          yValueMapper: (ChartData data, _) => data.value, // Используем value
          dataLabelSettings: const DataLabelSettings(isVisible: true),
        )
      ],
    );
  }
}

