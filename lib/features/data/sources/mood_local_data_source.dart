import 'package:mood_diary/core/services/cache_service.dart';
import '../../domain/models/mood_data.dart';

class MoodLocalDataSource {
  Future<List<MoodData>> getMoodData() async {
    return await CacheService().getMoodData(); 
  }
}
