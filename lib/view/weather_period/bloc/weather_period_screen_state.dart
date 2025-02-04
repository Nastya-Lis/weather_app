part of 'weather_period_screen_bloc.dart';

enum StatusForecast {
  init,
  success,
  error,
}

class WeatherPeriodScreenState extends Equatable {
  final List<Forecast>? forecast;
  final StatusForecast status;
  final String? errorMessage;

  const WeatherPeriodScreenState({
    required this.forecast,
    this.status = StatusForecast.init,
    this.errorMessage,
  });

  WeatherPeriodScreenState copyWith({
    List<Forecast>? forecast,
    StatusForecast? status,
    String? errorMessage,
  }) {
    return WeatherPeriodScreenState(
      forecast: forecast ?? this.forecast,
      status: status ?? this.status,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        forecast,
        status,
        errorMessage,
      ];
}
