import 'package:flutter/material.dart';
import 'package:mood_diary/core/constants/app_colors.dart';
import 'package:mood_diary/core/constants/app_dimens.dart';
import 'package:mood_diary/core/constants/app_text_styles.dart';

class SliderSection extends StatelessWidget {
  final double stressLevel;
  final double selfEsteem;
  final Function(double) onStressLevelChanged;
  final Function(double) onSelfEsteemChanged;

  const SliderSection({super.key, 
    required this.stressLevel,
    required this.selfEsteem,
    required this.onStressLevelChanged,
    required this.onSelfEsteemChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: AppDimens.mediumVerticalPadding),
        Text(
          'Уровень стресса',
          style: AppTextStyles.s16w800.copyWith(color: AppColors.black),
        ),
        Slider(
          value: stressLevel,
          onChanged: onStressLevelChanged,
          activeColor: AppColors.orange,
          inactiveColor: AppColors.grey,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Низкий',
              style: AppTextStyles.s11w400.copyWith(color: AppColors.lightGrey),
            ),
            Text(
              'Высокий',
              style: AppTextStyles.s11w400.copyWith(color: AppColors.lightGrey),
            ),
          ],
        ),
        const SizedBox(height: AppDimens.largeVerticalPadding),
        Text(
          'Самооценка',
          style: AppTextStyles.s16w800.copyWith(color: AppColors.black),
        ),
        Slider(
          value: selfEsteem,
          onChanged: onSelfEsteemChanged,
          activeColor: AppColors.orange,
          inactiveColor: AppColors.grey,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Неуверенность',
              style: AppTextStyles.s11w400.copyWith(color: AppColors.lightGrey),
            ),
            Text(
              'Уверенность',
              style: AppTextStyles.s11w400.copyWith(color: AppColors.lightGrey),
            ),
          ],
        ),
      ],
    );
  }
}
