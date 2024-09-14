import '../../../core/utils/storage_helper.dart';
import '../../domain/models/mood_data.dart';

class MoodLocalDataSource {
  Future<List<MoodData>> getMoodData() async {
    return await StorageHelper.loadMoodData();
  }
}
