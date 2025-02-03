part of 'weather_period_screen_bloc.dart';

enum StatusForecast {
  init,
  success,
  error,
}

class WeatherPeriodScreenState extends Equatable {
  final List<Forecast>? forecast;
  final StatusForecast status;

  const WeatherPeriodScreenState({
    required this.forecast,
    this.status = StatusForecast.init,
  });

  WeatherPeriodScreenState copyWith({
    List<Forecast>? forecast,
    StatusForecast? status,
  }) {
    return WeatherPeriodScreenState(
      forecast: forecast ?? this.forecast,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        forecast,
        status,
      ];
}
