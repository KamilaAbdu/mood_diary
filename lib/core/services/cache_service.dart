import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:mood_diary/features/domain/models/mood_data.dart';
import 'package:mood_diary/features/domain/models/mood_category_data.dart';

class CacheService {
  static const _moodDataKey = 'moodData';
  static const _moodCategoryDataKey = 'moodCategoryData';

  // Сохранение данных о настроениях
  Future<void> saveMoodData(List<MoodData> data) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonData = json.encode(data.map((e) => e.toJson()).toList());
    await prefs.setString(_moodDataKey, jsonData);
  }

  // Загрузка данных о настроениях
  Future<List<MoodData>> getMoodData() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonData = prefs.getString(_moodDataKey);
    if (jsonData == null) return [];
    final List<dynamic> data = json.decode(jsonData);
    return data.map((e) => MoodData.fromJson(e)).toList();
  }

  // Сохранение данных о категориях настроений
  Future<void> saveMoodCategoryData(List<MoodCategoryData> data) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonData = json.encode(data.map((e) => e.toJson()).toList());
    await prefs.setString(_moodCategoryDataKey, jsonData);
  }

  // Загрузка данных о категориях настроений
  Future<List<MoodCategoryData>> getMoodCategoryData() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonData = prefs.getString(_moodCategoryDataKey);
    if (jsonData == null) return [];
    final List<dynamic> data = json.decode(jsonData);
    return data.map((e) => MoodCategoryData.fromJson(e)).toList();
  }
}
