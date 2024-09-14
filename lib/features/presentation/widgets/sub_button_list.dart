import 'package:flutter/material.dart';
import 'package:mood_diary/core/constants/app_colors.dart';
import 'package:mood_diary/core/constants/app_text_styles.dart';

class SubButtonList extends StatelessWidget {
  final List<String> labels;
  final String selectedLabel;
  final Function(String) onSubButtonTap;

  const SubButtonList({
    required this.labels,
    required this.selectedLabel,
    required this.onSubButtonTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 108,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Wrap(
            spacing: 4.0,
            runSpacing: 4.0,
            children: labels.map((label) {
              final isSelected = label == selectedLabel;
              return GestureDetector(
                onTap: () => onSubButtonTap(label),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.orange : AppColors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: AppColors.white,
                      width: 1.0,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.purple11Opacity,
                        offset: const Offset(2, 4),
                        blurRadius: 11,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      label,
                      style: AppTextStyles.s11w400.copyWith(
                        color: isSelected ? AppColors.white : AppColors.grey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
