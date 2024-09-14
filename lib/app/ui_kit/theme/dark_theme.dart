import 'package:flutter/material.dart';
import 'package:mood_diary/app/ui_kit/theme/eleveted_button_style.dart';

ThemeData darkTheme = ThemeData.dark().copyWith(
  hintColor: Colors.grey.withOpacity(0.5),
  elevatedButtonTheme: darkElevatedButtonThemeData,
);
