import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../domain/models/mood_data.dart';

class MoodPieChart extends StatelessWidget {
  final List<MoodData> data;

  const MoodPieChart({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      series: <PieSeries<MoodData, String>>[
        PieSeries<MoodData, String>(
          dataSource: data,
          xValueMapper: (MoodData data, _) => data.date,
          yValueMapper: (MoodData data, _) => data.moodLevel,
          dataLabelSettings: const DataLabelSettings(isVisible: true),
        )
      ],
    );
  }
}
