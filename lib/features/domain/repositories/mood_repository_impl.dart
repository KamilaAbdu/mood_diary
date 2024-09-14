import 'package:mood_diary/features/data/sources/mood_local_data_source.dart';
import 'package:mood_diary/features/domain/models/mood_data.dart';
import 'package:mood_diary/features/data/repositories/mood_repository.dart';

class MoodRepositoryImpl implements MoodRepository {
   final MoodLocalDataSource localDataSource;

  MoodRepositoryImpl(this.localDataSource);

  @override
  Future<List<MoodData>> getMoodData() async {
    return []; 
  }

  @override
  Future<void> addMoodData(MoodData moodData) async {
  }
}
