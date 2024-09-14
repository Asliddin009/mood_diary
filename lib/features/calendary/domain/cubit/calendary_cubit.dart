import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'calendary_state.dart';

class CalendaryCubit extends Cubit<CalendaryState> {
  CalendaryCubit()
      : super(
          CalendaryState(
            year: DateTime.now().year,
            month: DateTime.now().month,
            day: DateTime.now().day,
          ),
        );

  void replaceDate(int year, int month, int day) {
    emit(CalendaryState(year: year, month: month, day: day));
  }

  bool isSelecteDay({
    required String day,
    required int month,
    required int year,
  }) {
    if (day == ' ') {
      return false;
    }
    final dayInt = int.parse(day);
    return dayInt == state.day && month == state.month && year == state.year;
  }
}
