import 'package:flutter/material.dart';
import 'package:mood_diary/core/constants/app_colors.dart';
import 'package:mood_diary/core/constants/app_text_styles.dart';

class SaveButton extends StatelessWidget {
  final VoidCallback onSave;

  const SaveButton({super.key, 
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: onSave,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.orange,
          padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 12),
        ),
        child: Text(
          'Сохранить',
          style: AppTextStyles.s20w400.copyWith(color: AppColors.white),
        ),
      ),
    );
  }
}
