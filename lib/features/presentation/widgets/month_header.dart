import 'package:flutter/material.dart';
import 'package:mood_diary/core/constants/app_colors.dart';
import 'package:mood_diary/core/constants/app_text_styles.dart';

class MonthHeader extends StatelessWidget {
  final int year;
  final String monthName;

  MonthHeader({super.key, required this.year, required this.monthName});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$year',
            style: AppTextStyles.s16w700.copyWith(color: AppColors.grey),
          ),
          Text(
            monthName,
            style: AppTextStyles.s24w700.copyWith(color: AppColors.black),
          ),
        ],
      ),
    );
  }
}
