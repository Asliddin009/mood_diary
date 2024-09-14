import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mood_diary/app/utils/date_time_utils.dart';
import 'package:mood_diary/features/calendary/domain/cubit/calendary_cubit.dart';

class CalendarMonthWidget extends StatelessWidget {
  const CalendarMonthWidget({
    required this.year,
    required this.month,
    super.key,
    this.mainMonth = false,
  });
  final int year;
  final int month;
  final bool mainMonth;

  @override
  Widget build(BuildContext context) {
    final list = UtilsDateTime.fillMonth(
      year,
      month,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: SizedBox(
        width: 150,
        height: 170,
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Text(
                UtilsDateTime.getMonthName(month),
                textAlign: TextAlign.left,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Table(
              children: [
                TableRow(
                  children: List.generate(
                    7,
                    (index) => CalendarDayYear(
                      day: list[index],
                      mainMonth: mainMonth,
                      month: month,
                      year: year,
                    ),
                  ),
                ),
                TableRow(
                  children: List.generate(
                    7,
                    (index) => CalendarDayYear(
                      day: list[index + 8],
                      mainMonth: mainMonth,
                      month: month,
                      year: year,
                    ),
                  ),
                ),
                TableRow(
                  children: List.generate(
                    7,
                    (index) => CalendarDayYear(
                      day: list[index + 15],
                      mainMonth: mainMonth,
                      month: month,
                      year: year,
                    ),
                  ),
                ),
                TableRow(
                  children: List.generate(
                    7,
                    (index) => CalendarDayYear(
                      day: list[index + 22],
                      mainMonth: mainMonth,
                      month: month,
                      year: year,
                    ),
                  ),
                ),
                TableRow(
                  children: List.generate(
                    7,
                    (index) => CalendarDayYear(
                      day: list[index + 29],
                      mainMonth: mainMonth,
                      month: month,
                      year: year,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CalendarDayYear extends StatelessWidget {
  const CalendarDayYear({
    required this.day,
    required this.month,
    required this.year,
    required this.mainMonth,
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
        : Container(
            height: 20,
            width: 20,
            margin: const EdgeInsets.all(4),
            child: CircleAvatar(
              backgroundColor: flag ? Colors.orange : Colors.transparent,
              child: SizedBox(
                child: Text(
                  day,
                  style: TextStyle(
                    fontSize: 10,
                    color: flag ? Colors.white : Colors.grey.shade900,
                  ),
                ),
              ),
            ),
          );
  }
}
