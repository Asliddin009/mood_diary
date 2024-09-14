import 'package:flutter/widgets.dart';
import 'package:mood_diary/di/app_depends.dart';

final class AppDependsProvider extends InheritedWidget {
  const AppDependsProvider({
    required super.child,
    required this.appDepends,
    super.key,
  });
  final AppDepends appDepends;
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;

  static AppDepends of(BuildContext context) {
    final provider =
        context.dependOnInheritedWidgetOfExactType<AppDependsProvider>();
    assert(provider != null, 'Depends not found');
    return provider!.appDepends;
  }
}
