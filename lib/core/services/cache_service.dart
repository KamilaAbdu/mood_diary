import 'package:mood_diary/features/domain/models/mood_category_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:mood_diary/features/domain/models/mood_data.dart';

class CacheService {
  static const _moodDataKey = 'moodData';
  static const _moodCategoryDataKey = 'moodCategoryData';

  Future<void> saveMoodData(List<MoodData> data) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonData = json.encode(data.map((e) => {
      'date': e.date,
      'moodLevel': e.moodLevel,
    }).toList());
    await prefs.setString(_moodDataKey, jsonData);
  }

  Future<List<MoodData>> getMoodData() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonData = prefs.getString(_moodDataKey);
    if (jsonData == null) return [];
    final List<dynamic> data = json.decode(jsonData);
    return data.map((e) => MoodData(e['date'], e['moodLevel'])).toList();
  }

  Future<void> saveMoodCategoryData(List<MoodCategoryData> data) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonData = json.encode(data.map((e) => {
      'category': e.category,
      'percentage': e.percentage,
    }).toList());
    await prefs.setString(_moodCategoryDataKey, jsonData);
  }

  Future<List<MoodCategoryData>> getMoodCategoryData() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonData = prefs.getString(_moodCategoryDataKey);
    if (jsonData == null) return [];
    final List<dynamic> data = json.decode(jsonData);
    return data.map((e) => MoodCategoryData(e['category'], e['percentage'])).toList();
  }
}