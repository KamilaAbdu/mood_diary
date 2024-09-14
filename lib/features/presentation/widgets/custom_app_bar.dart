import 'package:flutter/material.dart';
import 'package:mood_diary/core/constants/app_colors.dart';
import 'package:mood_diary/features/presentation/widgets/date_time_display.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final DateTime time;
  final VoidCallback onBackPressed;
  final VoidCallback onCalendarPressed;

  const CustomAppBar({
    super.key,
    required this.time,
    required this.onBackPressed,
    required this.onCalendarPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: onBackPressed,
        icon: const Icon(
          Icons.arrow_back_ios_new_rounded,
          weight: 24,
          color: AppColors.grey,
        ),
      ),
      title: Align(
        alignment: Alignment.center,
        child: DateTimeDisplay(time: time),
      ),
      actions: [
        IconButton(
          onPressed: onCalendarPressed,
          icon: const Icon(
            Icons.calendar_month_rounded,
            color: AppColors.grey,
            weight: 24,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
