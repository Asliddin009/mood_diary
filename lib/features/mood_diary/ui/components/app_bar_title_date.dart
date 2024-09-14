import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mood_diary/app/utils/color_hex.dart';
import 'package:mood_diary/app/utils/date_time_utils.dart';
import 'package:mood_diary/features/calendary/domain/cubit/calendary_cubit.dart';

class AppBarTitleDate extends StatelessWidget {
  const AppBarTitleDate({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendaryCubit, CalendaryState>(
      builder: (context, state) {
        return Center(
          child: Text(
            UtilsDateTime.dayMonthHHMM(
              DateTime.now().copyWith(
                year: state.year,
                month: state.month,
                day: state.day,
              ),
            ),
            style: TextStyle(color: HexColor.fromHex('#BCBCBF')),
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }
}
