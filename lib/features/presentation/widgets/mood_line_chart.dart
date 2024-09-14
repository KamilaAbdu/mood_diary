import 'package:flutter/material.dart';
import 'package:mood_diary/features/data/models/chart_data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:mood_diary/core/constants/app_colors.dart';

class MoodLineChart extends StatelessWidget {
  final List<ChartData> data;

  const MoodLineChart({required this.data, super.key});

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
          LineSeries<ChartData, String>(
            dataSource: data,
            xValueMapper: (ChartData moodData, _) => moodData.date,
            
            color: AppColors.orange,
            width: 2, yValueMapper: (ChartData datum, int index) {  },
          ),
        ],
      ),
    );
  }
}

