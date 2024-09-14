import 'package:flutter/material.dart';
import 'dart:async';
import 'package:mood_diary/core/constants/app_assets.dart';
import 'package:mood_diary/features/presentation/widgets/custom_app_bar.dart';
import 'package:mood_diary/features/presentation/screens/diary_screen.dart';
import 'package:mood_diary/features/presentation/screens/statistics_screen.dart';
import '../widgets/choice_chip_row.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var time = DateTime.now();
  Timer? timer;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      if (mounted) {
        setState(() {
          time = DateTime.now();
        });
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void _onChoiceChipSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<String> labels = ['Дневник настроения', 'Статистика'];
    final List<String> iconPaths = [
      AppAssets.diaryIC,
      AppAssets.statisticsIC,
    ];

    return Scaffold(
      appBar: CustomAppBar(
        time: time,
        onBackPressed: () {},
        onCalendarPressed: () {},
      ),
      body: Column(
        children: [
          ChoiceChipRow(
            currentIndex: _currentIndex,
            labels: labels,
            iconPaths: iconPaths,
            onChoiceChipSelected: _onChoiceChipSelected,
          ),
          Expanded(
            child: IndexedStack(
              index: _currentIndex,
              children: const [
                DiaryScreen(),
                StatisticsScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}