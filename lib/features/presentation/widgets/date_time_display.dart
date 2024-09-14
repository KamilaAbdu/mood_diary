import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mood_diary/core/constants/app_colors.dart';
import 'package:mood_diary/core/constants/app_text_styles.dart';

class DateTimeDisplay extends StatelessWidget {
  final DateTime time;

  const DateTimeDisplay({super.key, required this.time});

  @override
  Widget build(BuildContext context) {
    
    String formattedDateTime() {
      String day = DateFormat('d').format(time); 
      String month = _getRussianMonth(time.month); 
      String formattedTime =
          DateFormat('HH:mm').format(time); 
      return "$day $month, $formattedTime";
    }

    return Text(
      formattedDateTime(),
      style: AppTextStyles.s18w700.copyWith(color: AppColors.grey),
      textAlign: TextAlign.center,
    );
  }

  String _getRussianMonth(int month) {
    const months = [
      'Январь',
      'Февраль',
      'Март',
      'Апрель',
      'Май',
      'Июнь',
      'Июль',
      'Август',
      'Сентябрь',
      'Октябрь',
      'Ноябрь',
      'Декабрь'
    ];

    const monthsGenitive = [
      'Января',
      'Февраля',
      'Марта',
      'Апреля',
      'Мая',
      'Июня',
      'Июля',
      'Августа',
      'Сентября',
      'Октября',
      'Ноября',
      'Декабря'
    ];

   
    if (month >= 1 && month <= 12) {
      return monthsGenitive[month - 1];
    }
    return ''; 
  }
}
