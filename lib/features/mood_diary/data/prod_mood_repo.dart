import 'package:mood_diary/features/mood_diary/data/mock_data.dart';
import 'package:mood_diary/features/mood_diary/domain/entity/emotion_entity.dart';
import 'package:mood_diary/features/mood_diary/domain/i_mood_diary_repo.dart';

class ProdMoodRepo implements IMoodDiaryRepo {
  @override
  Future<List<MainEmotionEntity>> getEmotions() {
    throw UnimplementedError();
  }

  @override
  String get name => 'ProdMoodRepo';

  @override
  Future<bool> saveForm({
    required List<String> emotions,
    required double stressLevel,
    required double selfEsteemLevel,
    required String notes,
  }) {
    throw UnimplementedError();
  }

  @override
  List<MainEmotionEntity> getEmotionsForLoading() {
    return mockListEmotions;
  }
}
