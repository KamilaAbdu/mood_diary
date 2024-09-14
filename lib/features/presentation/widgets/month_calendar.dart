import 'package:flutter/material.dart';
import 'package:mood_diary/features/presentation/screens/calendar_screen.dart';
import 'package:mood_diary/features/presentation/widgets/day_widget.dart';
import 'package:mood_diary/features/presentation/widgets/month_header.dart';

class MonthCalendar extends StatelessWidget {
  final DateTime month;
  final DateTime today;
  final DateTime selectedDay;
  final ValueChanged<DateTime> onDaySelected;

  MonthCalendar({required this.month, required this.today, required this.selectedDay, required this.onDaySelected});

  @override
  Widget build(BuildContext context) {
    int year = month.year;
    int monthNumber = month.month;
    DateTime firstDayOfMonth = DateTime(year, monthNumber, 1);
    int daysInMonth = DateTime(year, monthNumber + 1, 0).day;
    int weekdayOfFirstDay = firstDayOfMonth.weekday;

    List<Widget> dayWidgets = [];
    for (int i = 1; i < weekdayOfFirstDay; i++) {
      dayWidgets.add(Container());
    }

    for (int day = 1; day <= daysInMonth; day++) {
      DateTime thisDay = DateTime(year, monthNumber, day);
      dayWidgets.add(DayWidget(
          day: thisDay,
          isSelected: isSameDay(selectedDay, thisDay),
          isToday: isSameDay(today, thisDay),
          onTap: () => onDaySelected(thisDay)));
    }

    return Column(
      children: [
        MonthHeader(year: year, monthName: _getMonthName(monthNumber)),
        GridView.count(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 7,
          children: dayWidgets,
        ),
      ],
    );
  }

  String _getMonthName(int monthNumber) {
    List<String> months = ['Январь', 'Февраль', 'Март', 'Апрель', 'Май', 'Июнь', 'Июль', 'Август', 'Сентябрь', 'Октябрь', 'Ноябрь', 'Декабрь'];
    return months[monthNumber - 1];
  }

  bool isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}
