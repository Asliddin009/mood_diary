import 'package:mood_diary/app/app_env.dart';
import 'package:mood_diary/app/app_runner.dart';

void main() async {
  await AppRuner(AppEnv.test).run();
}
