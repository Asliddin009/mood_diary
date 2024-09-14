import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mood_diary/app/utils/color_hex.dart';
import 'package:mood_diary/features/calendary/domain/cubit/calendary_cubit.dart';
import 'package:mood_diary/features/calendary/ui/components/calendary_month.dart';

class CalendarYearScreen extends StatelessWidget {
  const CalendarYearScreen({super.key});

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
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  context.read<CalendaryCubit>().replaceDate(
                        DateTime.now().year,
                        DateTime.now().month,
                        DateTime.now().day,
                      );
                  Navigator.pop(context);
                },
                child: const Text('Сегодня'),
              ),
            ),
          ),
        ],
        backgroundColor: HexColor.fromHex('#FFFDFC'),
      ),
      backgroundColor: HexColor.fromHex('#FFFDFC'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              '2024',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    // color: ,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Wrap(
              spacing: 15,
              children: <Widget>[
                for (final month in [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12])
                  CalendarMonthWidget(
                    year: 2024,
                    month: month,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
