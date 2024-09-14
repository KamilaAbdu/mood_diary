import 'package:flutter/material.dart';
import 'package:mood_diary/features/domain/models/mood_data.dart';
import '../repositories/mood_repository.dart';

class MoodProvider extends ChangeNotifier {
  final MoodRepository _repository;

  List<MoodData> _moodDataList = [];

  MoodProvider(this._repository);

  List<MoodData> get moodDataList => _moodDataList;

 
  Future<void> loadMoodData() async { 
    try {
      _moodDataList = await _repository.getMoodData();
      notifyListeners();
    } catch (e) {
    
      print('Error loading mood data: $e');
    }
  }

  Future<void> addMoodData(MoodData moodData) async {
    try {
      await _repository.addMoodData(moodData);
      await loadMoodData(); 
    } catch (e) {
      
      print('Error adding mood data: $e');
    }
  }
}
