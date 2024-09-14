import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mood_diary/features/mood_diary/domain/entity/emotion_entity.dart';
import 'package:mood_diary/features/mood_diary/domain/i_mood_diary_repo.dart';

part 'emotion_state.dart';

class EmotionCubit extends Cubit<EmotionState> {
  EmotionCubit(this.repo) : super(EmotionInitial());
  final IMoodDiaryRepo repo;

  Future<void> getMainEmotions() async {
    final mockList = repo.getEmotionsForLoading();
    emit(EmotionLoading(mockEmotions: mockList));
    final emotions = await repo.getEmotions();
    emit(EmotionDone(emotions: emotions));
  }

  List<String> getEmotions() {
    if (state is! EmotionDone) {
      return [];
    }

    return (state as EmotionDone).selectedEmotions;
  }

  void selectMainEmotion(MainEmotionEntity emotion) {
    if (state is! EmotionDone) {
      return;
    }
    final oldState = state as EmotionDone;
    if (oldState.selectEmotion == emotion) {
      emit(
        oldState.copyWith(
          selectEmotion: MainEmotionEntity(
            id: -1,
            assetsPath: '',
            name: '',
            emotions: [],
          ),
        ),
      );
      return;
    }
    emit(oldState.copyWith(selectEmotion: emotion));
  }

  void addEmotion(EmotionEntity emotion, int mainEmotionId) {
    if (state is! EmotionDone) {
      return;
    }
    final oldState = state as EmotionDone;
    late List<String> list;
    if (oldState.selectedEmotions.contains(emotion.name)) {
      list = oldState.selectedEmotions.where((e) => e != emotion.name).toList();
    } else {
      list = [...oldState.selectedEmotions, emotion.name];
    }
    emit(oldState.copyWith(selectedEmotions: list));
  }
}
