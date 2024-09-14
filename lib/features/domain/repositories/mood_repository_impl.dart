import 'package:mood_diary/core/services/cache_service.dart';
import 'package:mood_diary/features/domain/models/mood_data.dart';
import 'package:mood_diary/features/data/repositories/mood_repository.dart';

class MoodRepositoryImpl implements MoodRepository {
  final CacheService cacheService;

  MoodRepositoryImpl(this.cacheService);

  @override
  Future<List<MoodData>> loadMoodData() async {
    try {
      return await cacheService.getMoodData();  // Используем CacheService для загрузки данных
    } catch (e) {
      return [];
    }
  }

  @override
  Future<void> addMoodData(MoodData moodData) async {
    try {
      final currentData = await cacheService.getMoodData();
      currentData.add(moodData);
      await cacheService.saveMoodData(currentData);
    } catch (e) {
      rethrow;
    }
  }
  
  @override
  Future<List<MoodData>> getMoodData() {
    // TODO: implement getMoodData
    throw UnimplementedError();
  }
}

