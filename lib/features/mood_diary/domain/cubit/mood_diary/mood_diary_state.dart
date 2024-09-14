part of 'mood_diary_cubit.dart';

sealed class MoodDiaryState extends Equatable {
  const MoodDiaryState();

  @override
  List<Object> get props => [];
}

final class MoodDiaryInitial extends MoodDiaryState {
  const MoodDiaryInitial();

  @override
  List<Object> get props => [];
}

final class MoodDiaryLoadingForm extends MoodDiaryState {}

final class MoodDiaryError extends MoodDiaryState {
  const MoodDiaryError({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}

final class MoodDiaryDone extends MoodDiaryState {
  const MoodDiaryDone();

  @override
  List<Object> get props => [];
}
