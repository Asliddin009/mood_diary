import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mood_diary/app/utils/date_time_utils.dart';
import 'package:mood_diary/features/calendary/domain/cubit/calendary_cubit.dart';

class CalendarDay extends StatelessWidget {
  const CalendarDay({
    required this.day,
    required this.mainMonth,
    required this.month,
    required this.year,
    super.key,
  });
  final String day;
  final int month;
  final int year;
  final bool mainMonth;

  @override
  Widget build(BuildContext context) {
    final flag = context
        .read<CalendaryCubit>()
        .isSelecteDay(day: day, month: month, year: year);
    return day == ' '
        ? const SizedBox()
        : Padding(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              borderRadius: const BorderRadius.all(Radius.circular(50)),
              onTap: () {
                context
                    .read<CalendaryCubit>()
                    .replaceDate(year, month, int.parse(day));
                Navigator.pop(context);
              },
              child: CircleAvatar(
                backgroundColor: flag ? Colors.orange : Colors.transparent,
                child: Stack(
                  children: [
                    Align(
                      child: Text(
                        day,
                        style: TextStyle(
                          color: flag ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                    if (UtilsDateTime.isToday(day, month, year))
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 5),
                          height: 5,
                          width: 5,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            color: Colors.red,
                          ),
                        ),
                      )
                    else
                      const SizedBox(),
                  ],
                ),
              ),
            ),
          );
  }
}
