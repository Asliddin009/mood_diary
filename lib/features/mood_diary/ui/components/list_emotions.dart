import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mood_diary/features/mood_diary/domain/cubit/emotion/emotion_cubit.dart';
import 'package:mood_diary/features/mood_diary/domain/entity/emotion_entity.dart';

class ListEmotions extends StatelessWidget {
  const ListEmotions({required this.state, required this.validate, super.key});
  final EmotionDone state;
  final Function validate;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        for (final EmotionEntity emotion in state.selectEmotion?.emotions ?? [])
          GestureDetector(
            onTap: () {
              context
                  .read<EmotionCubit>()
                  .addEmotion(emotion, state.selectEmotion?.id ?? -1);
              // ignore: unnecessary_statements
              validate;
            },
            child: Container(
              constraints: const BoxConstraints(minHeight: 21, minWidth: 58),
              margin: const EdgeInsets.all(7),
              padding: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                color:
                    checkEmotion(emotion.name) ? Colors.orange : Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    spreadRadius: 1,
                    blurRadius: 3,
                  ),
                ],
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: SizedBox(child: Text(emotion.name)),
            ),
          ),
      ],
    );
  }

  bool checkEmotion(String emotion) {
    return state.selectedEmotions.contains(emotion);
  }
}
