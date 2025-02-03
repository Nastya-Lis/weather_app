import 'package:weather_cast/model/extension_methods.dart';

int timeOfDayConverter(String? date) {
  return date != null ? DateTime.parse(date).hour : 0;
}

String timeConverter(String? date) {
  return date != null
      ? "${timePattern(DateTime.parse(date).hour)}:${timePattern(DateTime.parse(date).minute)}"
      : "now";
}

String timePattern(int time) {
  return time <= 9 ? "0$time" : "$time";
}

String dateConverter(String? date) {
  return date != null
      ? "${DateTime.parse(date).day} ${MonthName.getMonthByCount(DateTime.parse(date).month).name.capitalize()}"
      : "";
}

enum MonthName {
  january,
  february,
  march,
  april,
  may,
  june,
  july,
  august,
  september,
  october,
  november,
  december,
  none;

  static MonthName getMonthByCount(int month) {
    switch (month) {
      case 1:
        return MonthName.january;
      case 2:
        return MonthName.february;
      case 3:
        return MonthName.march;
      case 4:
        return MonthName.april;
      case 5:
        return MonthName.may;
      case 6:
        return MonthName.june;
      case 7:
        return MonthName.july;
      case 8:
        return MonthName.august;
      case 9:
        return MonthName.september;
      case 10:
        return MonthName.october;
      case 11:
        return MonthName.november;
      case 12:
        return MonthName.december;
      default:
        return MonthName.none;
    }
  }
}
