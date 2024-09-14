import 'package:flutter/material.dart';
import 'package:mood_diary/core/constants/app_colors.dart';
import 'package:mood_diary/core/constants/app_dimens.dart';
import 'package:mood_diary/core/constants/app_text_styles.dart';

class NotesField extends StatelessWidget {
  final TextEditingController notesController;

  const NotesField({super.key, 
    required this.notesController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: AppDimens.smallVerticalPadding),
        Text(
          'Заметки',
          style: AppTextStyles.s16w800.copyWith(color: AppColors.black),
        ),
        const SizedBox(height: AppDimens.smallVerticalPadding),
        TextField(
          controller: notesController,
          maxLines: 3,
          decoration: InputDecoration(
            hintText: 'Сегодня я чувствую себя хорошо',
            hintStyle: AppTextStyles.s14w400.copyWith(color: AppColors.black),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.white),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.white),
            ),
            contentPadding: const EdgeInsets.all(8.0),
          ),
        ),
      ],
    );
  }
}
