import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mood_diary/features/mood_diary/domain/cubit/emotion/emotion_cubit.dart';
import 'package:mood_diary/features/mood_diary/domain/entity/emotion_entity.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ListMainEmotions extends StatelessWidget {
  const ListMainEmotions({
    required this.list,
    required this.enable,
    super.key,
    this.indexEmotion,
  });
  final List<MainEmotionEntity> list;
  final bool enable;
  final int? indexEmotion;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: Skeletonizer(
        enabled: enable,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: list.length,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.only(
              top: 15,
              bottom: 15,
              left: index == 0 ? 20 : 5,
              right: 5,
            ),
            child: InkWell(
              borderRadius: const BorderRadius.all(Radius.circular(50)),
              onTap: () {
                context.read<EmotionCubit>().selectMainEmotion(list[index]);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: indexEmotion == list[index].id
                          ? Colors.orange
                          : Colors.grey.shade200,
                      spreadRadius: 1,
                      blurRadius: 3,
                    ),
                  ],
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                ),
                height: 118,
                width: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      list[index].assetsPath,
                      height: 70,
                    ),
                    Text(list[index].name),
                  ],
                ),
              ),
            ),
          ),
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              width: 10,
            );
          },
        ),
      ),
    );
  }
}
