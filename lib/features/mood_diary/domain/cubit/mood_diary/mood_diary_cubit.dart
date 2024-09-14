import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mood_diary/features/mood_diary/domain/i_mood_diary_repo.dart';

part 'mood_diary_state.dart';

class MoodDiaryCubit extends Cubit<MoodDiaryState> {
  MoodDiaryCubit(this.repo) : super(const MoodDiaryInitial());
  final IMoodDiaryRepo repo;

  Future<void> saveForm({
    required List<String> emotions,
    required double stressLevel,
    required double selfEsteemLevel,
    required String notes,
  }) async {
    emit(MoodDiaryLoadingForm());
    final result = await repo.saveForm(
      emotions: emotions,
      stressLevel: stressLevel,
      selfEsteemLevel: selfEsteemLevel,
      notes: notes,
    );
    if (result == false) {
      emit(const MoodDiaryError(message: 'Ошибка при сохранении данных'));
      return;
    }
    emit(const MoodDiaryDone());
  }
}
