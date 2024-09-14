import 'package:mood_diary/features/data/sources/mood_local_data_source.dart';
import 'package:mood_diary/features/domain/models/mood_data.dart';

abstract class MoodRepository {
  MoodRepository(MoodLocalDataSource moodLocalDataSource);

  Future<List<MoodData>> getMoodData();
  Future<void> addMoodData(MoodData moodData);
}
