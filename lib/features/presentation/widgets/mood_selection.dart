import 'package:flutter/material.dart';
import 'package:mood_diary/core/constants/app_colors.dart';
import 'package:mood_diary/core/constants/app_dimens.dart';
import 'package:mood_diary/core/constants/app_text_styles.dart';
import 'package:mood_diary/features/presentation/widgets/%D1%81ustom_mood_button.dart';
import 'package:mood_diary/features/presentation/widgets/sub_button_list.dart';

class MoodSelection extends StatelessWidget {
  final int selectedIndex;
  final int expandedIndex;
  final List<String> buttonLabels;
  final List<String> buttonIcons;
  final List<List<String>> subButtonLabels;
  final Function(int) onMoodButtonSelected;
  final Function(String) onSubButtonTap;

  const MoodSelection({
    Key? key,
    required this.selectedIndex,
    required this.expandedIndex,
    required this.buttonLabels,
    required this.buttonIcons,
    required this.subButtonLabels,
    required this.onMoodButtonSelected,
    required this.onSubButtonTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: AppDimens.smallVerticalPadding),
        Text(
          'Что чувствуешь?',
          style: AppTextStyles.s16w800.copyWith(color: AppColors.black),
        ),
        const SizedBox(height: AppDimens.mediumVerticalPadding),
        SizedBox(
          height: 118,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: buttonLabels.length,
            itemBuilder: (context, index) {
              return CustomMoodButton(
                iconPath: buttonIcons[index],
                label: buttonLabels[index],
                isSelected: selectedIndex == index,
                onSelected: () {
                  onMoodButtonSelected(index);
                },
              );
            },
          ),
        ),
        if (expandedIndex != -1) ...[
          const SizedBox(height: AppDimens.mediumVerticalPadding),
          SubButtonList(
            labels: subButtonLabels[expandedIndex],
            selectedLabel: '',
            onSubButtonTap: onSubButtonTap,
          ),
        ],
      ],
    );
  }
}
