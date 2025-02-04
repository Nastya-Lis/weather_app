part of 'current_weather_screen_bloc.dart';

enum StatusCurrentWeather {
  init,
  success,
  loading,
  error,
}

class CurrentWeatherScreenState extends Equatable {
  final Weather? weather;
  final TimeOfDayEnum? timeOfDayEnum;
  final StatusCurrentWeather status;
  final String? errorMessage;

  const CurrentWeatherScreenState({
    required this.weather,
    this.timeOfDayEnum = TimeOfDayEnum.morning,
    this.status = StatusCurrentWeather.init,
    this.errorMessage,
  });

  CurrentWeatherScreenState copyWith({
    Weather? weather,
    TimeOfDayEnum? timeOfDayEnum,
    StatusCurrentWeather? status,
    String? errorMessage,
  }) {
    return CurrentWeatherScreenState(
      weather: weather ?? this.weather,
      timeOfDayEnum: timeOfDayEnum ?? this.timeOfDayEnum,
      status: status ?? this.status,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        weather,
        timeOfDayEnum,
        status,
        errorMessage,
      ];
}
