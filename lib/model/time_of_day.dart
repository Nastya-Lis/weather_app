import 'package:flutter/material.dart';

enum TimeOfDayEnum {
  morning(Colors.lightBlue),
  afternoon(Colors.blue),
  evening(Colors.indigo),
  night(Colors.blueGrey);

  final MaterialColor color;

  static TimeOfDayEnum getCurrentTimeDay(int hour) {
    if (6 <= hour && hour <= 12) {
      return TimeOfDayEnum.morning;
    } else if (12 < hour && hour <= 18) {
      return TimeOfDayEnum.afternoon;
    } else if (18 < hour && hour > 0) {
      return TimeOfDayEnum.evening;
    } else if (0 <= hour && hour < 6) {
      return TimeOfDayEnum.night;
    } else {
      return TimeOfDayEnum.morning;
    }
  }

  const TimeOfDayEnum(this.color,);
}
