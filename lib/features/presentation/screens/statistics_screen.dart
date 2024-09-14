import 'package:flutter/material.dart';
import 'package:mood_diary/core/constants/app_dimens.dart';
import 'package:mood_diary/features/data/providers/mood_provider.dart';
import 'package:mood_diary/features/presentation/widgets/statistics_title.dart';
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
          const Center(child: StatisticsTitle()),
          const SizedBox(height: AppDimens.mediumVerticalPadding),
          MoodLineChart(data: moodData),  
          const SizedBox(height: AppDimens.smallVerticalPadding),
          MoodPieChart(data: moodData),  
        ],
      ),
    );
  }
}
