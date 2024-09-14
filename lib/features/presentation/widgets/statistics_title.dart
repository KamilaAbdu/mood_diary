import 'package:flutter/material.dart';
import 'package:mood_diary/core/constants/app_colors.dart';
import 'package:mood_diary/core/constants/app_text_styles.dart';

class StatisticsTitle extends StatelessWidget {
  const StatisticsTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        'Статистика',
        style: AppTextStyles.s20w400.copyWith(color: AppColors.black),
        textAlign: TextAlign.center,
      ),
    );
  }
}
