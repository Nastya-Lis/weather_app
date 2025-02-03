part of 'current_weather_screen_bloc.dart';

enum StatusCurrentWeather {
  init,
  success,
  error,
}

class CurrentWeatherScreenState extends Equatable {
  final Weather? weather;
  final TimeOfDayEnum? timeOfDayEnum;
  final StatusCurrentWeather status;

  const CurrentWeatherScreenState({
    required this.weather,
    this.timeOfDayEnum = TimeOfDayEnum.morning,
    this.status = StatusCurrentWeather.init,
  });

  CurrentWeatherScreenState copyWith({
    Weather? weather,
    TimeOfDayEnum? timeOfDayEnum,
    StatusCurrentWeather? status,
  }) {
    return CurrentWeatherScreenState(
      weather: weather ?? this.weather,
      timeOfDayEnum: timeOfDayEnum ?? this.timeOfDayEnum,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        weather,
        timeOfDayEnum,
        status,
      ];
}
