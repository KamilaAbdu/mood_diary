import 'package:flutter/material.dart';
import 'package:mood_diary/core/constants/app_colors.dart';
import 'package:mood_diary/core/constants/app_text_styles.dart';

class SubButtonList extends StatelessWidget {
  final List<String> labels;
  final String? selectedLabel;
  final Function(String) onSubButtonTap;

  const SubButtonList({
    Key? key,
    required this.labels,
    required this.onSubButtonTap,
    this.selectedLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 4.0,
      runSpacing: 0.0,
      children: labels.map((label) {
        bool isSelected = label == selectedLabel;
        return Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AppColors.purple11Opacity,
                blurRadius: 10.0,
                offset: const Offset(2, 4),
              ),
            ],
          ),
          child: ChoiceChip(
            label: Text(label,
                style: AppTextStyles.s11w400.copyWith(
                  color: isSelected ? Colors.white : AppColors.black,
                )),
            selected: isSelected,
            onSelected: (bool selected) {
              onSubButtonTap(label);
            },
            selectedColor: AppColors.orange,
            backgroundColor: isSelected ? AppColors.orange : AppColors.white,
            labelPadding:
                const EdgeInsets.symmetric(horizontal: 2.0, vertical: 1.0),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(3), right: Radius.circular(3)),
              side: BorderSide(
                color: AppColors.white,
                width: 1.0,
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
          ),
        );
      }).toList(),
    );
  }
}
