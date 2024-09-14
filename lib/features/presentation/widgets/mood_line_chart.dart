import 'package:flutter/material.dart';
import 'package:mood_diary/features/domain/models/mood_data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:mood_diary/core/constants/app_colors.dart';

class MoodLineChart extends StatelessWidget {
  final List<MoodData> data;

  const MoodLineChart({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: SfCartesianChart(
        primaryXAxis: const CategoryAxis(
          title: AxisTitle(text: 'Дата'),
        ),
        primaryYAxis: const NumericAxis(
          title: AxisTitle(text: 'Уровень настроения'),
        ),
        series: <CartesianSeries>[
          LineSeries<MoodData, String>(
            dataSource: data,
            xValueMapper: (MoodData moodData, _) => moodData.date,
            yValueMapper: (MoodData moodData, _) => moodData.moodLevel,
            color: AppColors.orange,
            width: 2,
          ),
        ],
      ),
    );
  }
}
