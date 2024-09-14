import 'package:mood_diary/app/app_env.dart';
import 'package:mood_diary/features/mood_diary/data/mock_mood_repo.dart';
import 'package:mood_diary/features/mood_diary/data/prod_mood_repo.dart';
import 'package:mood_diary/features/mood_diary/domain/i_mood_diary_repo.dart';

typedef OnError = void Function(
  String name,
  Object error,
  StackTrace stackTrace,
);
typedef OnProgress = void Function(String name, String progresss);

enum _AppDeps { calendary, moodDiary }

final class AppDepends {
  AppDepends(
    this.appEnv,
  );

  late final IMoodDiaryRepo moodDiaryRepo;

  final AppEnv appEnv;

  Future<void> init({
    required OnError onError,
    required OnProgress onProgress,
  }) async {
    //init mood diary
    try {
      moodDiaryRepo = switch (appEnv) {
        AppEnv.test => MockMoodRepo(),
        AppEnv.prod => ProdMoodRepo()
      };
      onProgress(
        'moodDiary',
        _calc(_AppDeps.moodDiary.index, _AppDeps.values.length),
      );
    } on Exception catch (error, stackTrace) {
      onError('moodDiary', error, stackTrace);
    }
  }

  String _calc(int current, int total) {
    return ((current + 1) / total * 100).toStringAsFixed(0);
  }
}
