import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mood_diary/features/mood_diary/domain/cubit/emotion/emotion_cubit.dart';
import 'package:mood_diary/features/mood_diary/ui/components/list_emotions.dart';
import 'package:mood_diary/features/mood_diary/ui/components/list_main_emotions.dart';

class EmotionWidget extends StatelessWidget {
  const EmotionWidget({required this.validate, super.key});
  final Function validate;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmotionCubit, EmotionState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                width: double.infinity,
                child: Text(
                  'Что чувствуешь?',
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              ListMainEmotions(
                indexEmotion:
                    state is EmotionDone ? state.selectEmotion?.id : null,
                list: state is EmotionLoading
                    ? state.mockEmotions
                    : state is EmotionDone
                        ? state.emotions
                        : [],
                enable: state is EmotionLoading,
              ),
              if (state is EmotionDone)
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: ListEmotions(
                    state: state,
                    validate: validate,
                  ),
                )
              else
                const SizedBox(),
            ],
          ),
        );
      },
    );
  }
}
