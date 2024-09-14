import 'package:flutter/material.dart';
import 'package:mood_diary/core/constants/app_colors.dart';
import 'package:mood_diary/core/constants/app_text_styles.dart';
import 'package:mood_diary/features/presentation/widgets/month_calendar.dart';
import 'package:mood_diary/features/presentation/widgets/weekday_header.dart';

void main() => runApp(MaterialApp(home: CalendarScreen()));

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  late DateTime _selectedDay;
  DateTime _today = DateTime.now();

  @override
  void initState() {
    super.initState();
    _selectedDay = _today;
  }

  void _goToToday() {
    setState(() {
      _selectedDay = _today;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.close,
            size: 26,
            color: AppColors.grey,
          ),
          onPressed: () {
            Navigator.of(context).maybePop();
          },
        ),
        title: TextButton(
          onPressed: _goToToday,
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Сегодня',
              style: AppTextStyles.s18w600.copyWith(color: AppColors.grey)
            ),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          WeekdayHeader(),
          Expanded(
            child: ListView.builder(
              itemCount: 12,
              itemBuilder: (context, index) {
                DateTime month = DateTime(_today.year, _today.month + index, 1);
                return MonthCalendar(
                    month: month,
                    today: _today,
                    selectedDay: _selectedDay,
                    onDaySelected: (DateTime day) {
                      setState(() {
                        _selectedDay = day;
                      });
                    });
              },
            ),
          ),
        ],
      ),
    );
  }
}
