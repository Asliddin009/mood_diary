import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mood_diary/app/app.dart';
import 'package:mood_diary/app/app_env.dart';
import 'package:mood_diary/di/app_depends.dart';

class AppRuner {
  AppRuner(this.appEnv);
  final AppEnv appEnv;
  Future<void> run() async {
    await runZonedGuarded(() async {
      await initApp();
      final appDepends = AppDepends(appEnv);
      await appDepends.init(
        onError: (name, error, stackTrace) {
          log('ошибка $name: $error, $stackTrace');
          throw Exception('$name: $error, $stackTrace');
        },
        onProgress: (name, progresss) {
          log('Init $name progress $progresss%');
        },
      );
      runApp(App(appDepends: appDepends));
      WidgetsBinding.instance.addPostFrameCallback((_) {
        WidgetsBinding.instance.allowFirstFrame();
      });
    }, (error, stack) {
      log(error.toString(), stackTrace: stack, error: error);
      runApp(_AppErrorWidget(message: error.toString()));
    });
  }

  Future<void> initApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    WidgetsBinding.instance.deferFirstFrame();
  }
}

class _AppErrorWidget extends StatelessWidget {
  const _AppErrorWidget({required this.message});

  final String message;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(message),
        ),
      ),
    );
  }
}
