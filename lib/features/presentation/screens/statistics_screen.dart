import 'package:flutter/material.dart';
import 'package:mood_diary/features/data/providers/mood_provider.dart';
import 'package:provider/provider.dart';
import '../widgets/mood_line_chart.dart';
import '../widgets/mood_pie_chart.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final moodData = context.watch<MoodProvider>().moodDataList;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Статистика настроения',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 20),
          MoodLineChart(data: moodData),  
          const SizedBox(height: 20),
          MoodPieChart(data: moodData),  
        ],
      ),
    );
  }
}
