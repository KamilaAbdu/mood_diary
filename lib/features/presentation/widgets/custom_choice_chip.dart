import 'package:flutter/material.dart';
import 'package:mood_diary/core/constants/app_colors.dart';
import 'package:mood_diary/core/constants/app_text_styles.dart';

class CustomChoiceChip extends StatelessWidget {
  final String label;

  final bool isSelected;
  final VoidCallback onSelected;
  final String iconPath;

  const CustomChoiceChip({
    required this.label,
    required this.isSelected,
    required this.onSelected,
    super.key,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(iconPath, width: 12,
              color: isSelected
                  ? AppColors.white
                  : AppColors.grey), 
          const SizedBox(width: 8),
          Text(
            label,
            style: AppTextStyles.s12w500.copyWith(
              color: isSelected ? AppColors.white : AppColors.grey,
            ),
          ),
        ],
      ),
      selected: isSelected,
      selectedColor: AppColors.orange,
      backgroundColor: AppColors.lightGreyBG,
      onSelected: (_) => onSelected(),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(47),
      ),
      side: BorderSide.none,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      labelPadding: EdgeInsets.zero,
      showCheckmark: false,
      elevation: isSelected ? 4.0 : 0.0,
    );
  }
}
