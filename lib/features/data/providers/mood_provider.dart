import 'package:flutter/material.dart';
import 'package:mood_diary/features/data/models/chart_data.dart';
import 'package:mood_diary/features/domain/models/mood_data.dart';
import 'package:mood_diary/features/domain/repositories/mood_repository_impl.dart';

class MoodProvider with ChangeNotifier {
  final MoodRepositoryImpl moodRepositoryImpl;
  final List<ChartData> _moodDataList = [];

  MoodProvider(this.moodRepositoryImpl) {
    loadMoodData(); // Загружаем данные при инициализации
  }

  List<ChartData> get moodDataList => _moodDataList;

  Future<void> loadMoodData() async {
    final List<MoodData> loadedData = await moodRepositoryImpl.loadMoodData();

    notifyListeners(); // Уведомляем подписчиков после загрузки данных
  }

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
      final existingData = _moodDataList[index];
      _moodDataList[index] = ChartData(
        date: existingData.date,
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
