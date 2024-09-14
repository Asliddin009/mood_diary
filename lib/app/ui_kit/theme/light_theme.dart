import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mood_diary/app/ui_kit/theme/eleveted_button_style.dart';

ThemeData lightTheme = ThemeData(
  hintColor: Colors.grey.withOpacity(0.5),
  elevatedButtonTheme: lightElevatedButtonThemeData,
  scaffoldBackgroundColor: Colors.grey.shade300,
  textTheme: TextTheme(
    labelMedium: GoogleFonts.nunito(fontSize: 12),
  ),
);
