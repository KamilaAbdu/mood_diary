import 'package:flutter/material.dart';
import 'package:mood_diary/features/data/models/chart_data.dart';
import 'package:mood_diary/features/domain/repositories/mood_repository_impl.dart';

class MoodProvider with ChangeNotifier {
  final List<ChartData> _moodDataList = [];

  MoodProvider(MoodRepositoryImpl moodRepositoryImpl);

  List<ChartData> get moodDataList => _moodDataList;

  void addMoodData(ChartData moodData) {
    _moodDataList.add(moodData);
    notifyListeners();
  }

  void removeMoodData(String label) {
    _moodDataList.removeWhere((data) => data.label == label);
    notifyListeners();
  }

  void updateMoodData(String label, double newValue) {
    final index = _moodDataList.indexWhere((data) => data.label == label);
    if (index != -1) {
      // Обновляем данные по метке. Предположим, что метка уникальна и не изменяется.
      final existingData = _moodDataList[index];
      _moodDataList[index] = ChartData(
        date: existingData.date, // предполагаем, что дата не изменяется
        label: existingData.label,
        value: newValue, 
      );
      notifyListeners();
    }
  }

  void clearMoodData() {
    _moodDataList.clear();
    notifyListeners();
  }
}

