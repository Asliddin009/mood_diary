// ignore_for_file: parameter_assignments

abstract class UtilsDateTime {
  static String getHourAndMinute(DateTime date) {
    final hour = date.hour < 10 ? '0${date.hour}' : date.hour.toString();
    final minute =
        date.minute < 10 ? '0${date.minute}' : date.minute.toString();
    return '$hour:$minute';
  }

  //1 января 09:00
  static String dayMonthHHMM(DateTime date) {
    final ruMonth = getMonthName(date.month);
    final hour = date.hour < 10 ? '0${date.hour}' : date.hour.toString();
    final minute =
        date.minute < 10 ? '0${date.minute}' : date.minute.toString();
    return '${date.day} $ruMonth $hour:$minute';
  }

  static String getMonthName(int month) {
    return switch (month) {
      (1) => 'Января',
      (2) => 'Февраля',
      (3) => 'Марта',
      (4) => 'Апреля',
      (5) => 'Мая',
      (6) => 'Июня',
      (7) => 'Июля',
      (8) => 'Августа',
      (9) => 'Сентября',
      (10) => 'Октября',
      (11) => 'Ноября',
      (12) => 'Декабря',
      (_) => 'ошибка',
    };
  }

  static int daysInMonth(int year, int month) {
    if (month < 1 || month > 12) {
      throw ArgumentError('Месяц должен быть от 1 до 12');
    }
    // Определяем, является ли год високосным
    final isLeapYear = (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);

    switch (month) {
      case 1: // Январь
      case 3: // Март
      case 5: // Май
      case 7: // Июль
      case 8: // Август
      case 10: // Октябрь
      case 12: // Декабрь
        return 31;
      case 4: // Апрель
      case 6: // Июнь
      case 9: // Сентябрь
      case 11: // Ноябрь
        return 30;
      case 2: // Февраль
        return isLeapYear ? 29 : 28;
      default:
        throw ArgumentError('Некорректный месяц');
    }
  }

  static int dayOfWeek(int year, int month) {
    if (month < 1 || month > 12) {
      throw ArgumentError('Месяц должен быть от 1 до 12');
    }

    // Если месяц январь или февраль, пересчитываем год
    if (month == 1 || month == 2) {
      month += 12;
      year -= 1;
    }

    // Используем формулу Зеллера
    final k = year % 100; // Последние две цифры года
    final j = year ~/ 100; // Первые две цифры года

    // Формула Зеллера
    final dayOfWeek =
        (1 + (13 * (month + 1)) ~/ 5 + k + (k ~/ 4) + (j ~/ 4) - (2 * j)) % 7;
    switch (dayOfWeek) {
      case 0:
        return 6;
      case 1:
        return 7;
      case 2:
        return 1;
      case 3:
        return 2;
      case 4:
        return 3;
      case 5:
        return 4;
      case 6:
        return 5;
      default:
        return 0; // Не должно произойти
    }
  }

  static List<String> fillMonth(int year, int month) {
    if (month < 1 || month > 12) {
      throw ArgumentError('Месяц должен быть от 1 до 12');
    }
    // Определяем количество дней в месяце
    final days = daysInMonth(year, month);

    // Определяем первый день месяца (день недели)
    final firstDayWeekday = dayOfWeek(year, month);

    // Заполняем список пробелами перед первым днем
    final monthDays = <String>[...List.filled(firstDayWeekday - 1, ' ')];

    // Заполняем день месяца
    for (var day = 1; day <= days; day++) {
      monthDays.add(day.toString());
    }

    // Добавляем пробелы после последнего дня месяца до 42 ячеек
    while (monthDays.length < 42) {
      monthDays.add(' ');
    }
    return monthDays;
  }

  static bool isToday(String day, int month, int year) {
    if (day == ' ') {
      return false;
    }
    final dayInt = int.parse(day);
    return dayInt == DateTime.now().day &&
        month == DateTime.now().month &&
        year == DateTime.now().year;
  }
}
