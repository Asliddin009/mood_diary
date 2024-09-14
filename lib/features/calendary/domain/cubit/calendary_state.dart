part of 'calendary_cubit.dart';

final class CalendaryState extends Equatable {
  const CalendaryState({
    required this.year,
    required this.month,
    required this.day,
  });
  final int year;
  final int month;
  final int day;

  @override
  List<Object> get props => [
        year,
        month,
        day,
      ];
}
