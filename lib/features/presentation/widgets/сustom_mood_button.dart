import 'package:flutter/material.dart';
import 'package:mood_diary/core/constants/app_colors.dart';
import 'package:mood_diary/core/constants/app_text_styles.dart';

class CustomMoodButton extends StatelessWidget {
  final String iconPath;
  final String label;
  final bool isSelected;
  final VoidCallback onSelected;

  const CustomMoodButton({
    required this.iconPath,
    required this.label,
    required this.isSelected,
    required this.onSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelected,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        width: 83,
        height: 118,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(76), bottom: Radius.circular(76)),
          border: isSelected
              ? Border.all(color: AppColors.orange, width: 2.0)
              : Border.all(color: Colors.transparent, width: 0.0),
          boxShadow: [
            BoxShadow(
              color: AppColors.purple11Opacity,
              offset: const Offset(2, 4),
              blurRadius: 11,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(iconPath, width: 53, height: 50), 
            const SizedBox(height: 8.0),
            Text(
              label,
              style: AppTextStyles.s11w400.copyWith(color: AppColors.black),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
