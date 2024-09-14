import 'package:flutter/material.dart';
import 'package:mood_diary/core/constants/app_colors.dart';
import 'package:mood_diary/core/constants/app_dimens.dart';
import 'package:mood_diary/core/constants/app_text_styles.dart';
import 'package:mood_diary/features/presentation/screens/main_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Добро пожаловать!',
              style: AppTextStyles.s18w700.copyWith(color: AppColors.black),
            ),
            const SizedBox(height: AppDimens.mediumVerticalPadding),
            Text(
              'Мы рады видеть вас в нашем приложении.',
              style: AppTextStyles.s14w400.copyWith(color: AppColors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MainScreen(),
            ),
          );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              ),
              child: Text(
                'Продолжить',
                style: AppTextStyles.s14w400.copyWith(color: AppColors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
