import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mood_diary/app/ui_kit/theme/light_theme.dart';
import 'package:mood_diary/di/app_depends.dart';
import 'package:mood_diary/di/app_depends_provider.dart';
import 'package:mood_diary/features/calendary/domain/cubit/calendary_cubit.dart';
import 'package:mood_diary/features/mood_diary/domain/cubit/emotion/emotion_cubit.dart';
import 'package:mood_diary/features/mood_diary/domain/cubit/mood_diary/mood_diary_cubit.dart';
import 'package:mood_diary/features/mood_diary/ui/mood_diary_screen.dart';

class App extends StatelessWidget {
  const App({required this.appDepends, super.key});
  final AppDepends appDepends;
  @override
  Widget build(BuildContext context) {
    return AppDependsProvider(
      key: const ValueKey('AppDependsProvider'),
      appDepends: appDepends,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (BuildContext context) =>
                MoodDiaryCubit(appDepends.moodDiaryRepo),
          ),
          BlocProvider(
            create: (BuildContext context) =>
                EmotionCubit(appDepends.moodDiaryRepo),
          ),
          BlocProvider(
            create: (BuildContext context) => CalendaryCubit(),
          ),
        ],
        child: const _App(),
      ),
    );
  }
}

class _App extends StatelessWidget {
  const _App();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      home: const MoodDiaryScreen(),
    );
  }
}
