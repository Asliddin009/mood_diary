import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mood_diary/app/utils/color_hex.dart';
import 'package:mood_diary/app/utils/date_time_utils.dart';
import 'package:mood_diary/features/calendary/domain/cubit/calendary_cubit.dart';
import 'package:mood_diary/features/calendary/ui/calendary_year_screen.dart';
import 'package:mood_diary/features/calendary/ui/components/calendary_day.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.close),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {
                context.read<CalendaryCubit>().replaceDate(
                      DateTime.now().year,
                      DateTime.now().month,
                      DateTime.now().day,
                    );
                Navigator.pop(context);
              },
              child: Text(
                'Сегодня',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(color: HexColor.fromHex('#BCBCBF'), fontSize: 18),
              ),
            ),
          ),
        ],
        backgroundColor: HexColor.fromHex('#FFFDFC'),
      ),
      backgroundColor: HexColor.fromHex('#FFFDFC'),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    WeekdayHeader('ПН'),
                    WeekdayHeader('ВТ'),
                    WeekdayHeader('СР'),
                    WeekdayHeader('ЧТ'),
                    WeekdayHeader('ПТ'),
                    WeekdayHeader('СБ'),
                    WeekdayHeader('ВС'),
                  ],
                ),
              ),
            ),
            CalendarMonth(month: 8, year: 2024),
            CalendarMonth(
              month: 9,
              year: 2024,
              mainMonth: true,
            ),
            CalendarMonth(month: 10, year: 2024),
          ],
        ),
      ),
    );
  }
}

class WeekdayHeader extends StatelessWidget {
  const WeekdayHeader(this.day, {super.key});
  final String day;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Text(
          day,
          style: TextStyle(
            color: Colors.grey[700],
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class CalendarMonth extends StatelessWidget {
  const CalendarMonth({
    required this.month,
    required this.year,
    super.key,
    this.mainMonth = false,
  });
  final int month;
  final int year;
  final bool mainMonth;

  @override
  Widget build(BuildContext context) {
    final list = UtilsDateTime.fillMonth(
      year,
      month,
    );
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                // ignore: inference_failure_on_instance_creation
                MaterialPageRoute(
                  builder: (BuildContext context) => const CalendarYearScreen(),
                ),
              );
            },
            child: SizedBox(
              height: 40,
              width: 300,
              child: Text(
                year.toString(),
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(color: HexColor.fromHex('#BCBCBF'), fontSize: 18),
              ),
            ),
          ),
          Text(
            UtilsDateTime.getMonthName(month),
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Table(
            children: [
              TableRow(
                children: List.generate(
                  7,
                  (index) => CalendarDay(
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
                  (index) => CalendarDay(
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
                  (index) => CalendarDay(
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
                  (index) => CalendarDay(
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
                  (index) => CalendarDay(
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
    );
  }
}
