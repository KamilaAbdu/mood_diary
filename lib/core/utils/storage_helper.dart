import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../../features/domain/models/mood_data.dart';

class StorageHelper {
  static Future<void> saveMoodData(List<MoodData> moodData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> encodedData =
        moodData.map((data) => json.encode(data.toJson())).toList();
    await prefs.setStringList('moodData', encodedData);
  }

  static Future<List<MoodData>> loadMoodData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> encodedData = prefs.getStringList('moodData') ?? [];
    return encodedData
        .map((data) => MoodData.fromJson(json.decode(data)))
        .toList();
  }
}
