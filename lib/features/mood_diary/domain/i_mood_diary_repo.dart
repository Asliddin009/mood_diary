import 'package:mood_diary/features/mood_diary/domain/entity/emotion_entity.dart';

abstract interface class IMoodDiaryRepo {
  String get name;

  Future<List<MainEmotionEntity>> getEmotions();
  List<MainEmotionEntity> getEmotionsForLoading();
  Future<bool> saveForm({
    required List<String> emotions,
    required double stressLevel,
    required double selfEsteemLevel,
    required String notes,
  });
}
