part of 'emotion_cubit.dart';

sealed class EmotionState extends Equatable {
  const EmotionState();

  @override
  List<Object> get props => [];
}

final class EmotionInitial extends EmotionState {}

final class EmotionLoading extends EmotionState {
  const EmotionLoading({required this.mockEmotions});
  final List<MainEmotionEntity> mockEmotions;

  @override
  List<Object> get props => [mockEmotions];
}

final class EmotionDone extends EmotionState {
  const EmotionDone({
    required this.emotions,
    this.selectEmotion,
    this.selectedEmotions = const [],
  });
  final List<MainEmotionEntity> emotions;
  final MainEmotionEntity? selectEmotion;
  final List<String> selectedEmotions;

  @override
  List<Object> get props => [emotions, selectedEmotions, selectEmotion!];

  //copyWith
  EmotionDone copyWith({
    List<MainEmotionEntity>? emotions,
    MainEmotionEntity? selectEmotion,
    List<String>? selectedEmotions,
  }) {
    return EmotionDone(
      selectedEmotions: selectedEmotions ?? this.selectedEmotions,
      emotions: emotions ?? this.emotions,
      selectEmotion: selectEmotion ?? this.selectEmotion,
    );
  }

  //compare to =
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EmotionDone &&
        other.emotions == emotions &&
        other.selectEmotion == selectEmotion &&
        other.selectedEmotions == selectedEmotions;
  }

  @override
  int get hashCode =>
      emotions.hashCode ^ selectEmotion.hashCode ^ selectedEmotions.hashCode;
}

final class EmotionError extends EmotionState {
  const EmotionError({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}
