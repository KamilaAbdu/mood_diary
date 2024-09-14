import 'package:flutter/material.dart';
import 'package:mood_diary/features/presentation/widgets/custom_choice_chip.dart';

class ChoiceChipRow extends StatelessWidget {
  final int currentIndex;
  final List<String> labels;
  final List<String> iconPaths;
  final void Function(int) onChoiceChipSelected;

  const ChoiceChipRow({
    required this.currentIndex,
    required this.labels,
    required this.iconPaths,
    required this.onChoiceChipSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(labels.length, (index) {
        return Padding(
          padding: EdgeInsets.zero, 
          child: CustomChoiceChip(
            label: labels[index],
            isSelected: currentIndex == index,
            onSelected: () => onChoiceChipSelected(index),
            iconPath: iconPaths[index],
          ),
        );
      }),
    );
  }
}

