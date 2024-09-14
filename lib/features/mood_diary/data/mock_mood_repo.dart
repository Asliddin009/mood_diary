import 'package:mood_diary/features/mood_diary/data/mock_data.dart';
import 'package:mood_diary/features/mood_diary/domain/entity/emotion_entity.dart';
import 'package:mood_diary/features/mood_diary/domain/i_mood_diary_repo.dart';

class MockMoodRepo implements IMoodDiaryRepo {
  @override
  Future<List<MainEmotionEntity>> getEmotions() {
    return Future.delayed(const Duration(seconds: 1), () => mockListEmotions);
  }

  @override
  String get name => 'MockMoodRepo';

  @override
  Future<bool> saveForm({
    required List<String> emotions,
    required double stressLevel,
    required double selfEsteemLevel,
    required String notes,
  }) {
    return Future.delayed(const Duration(seconds: 1), () => true);
  }

  @override
  List<MainEmotionEntity> getEmotionsForLoading() {
    return mockListEmotions;
  }
}
