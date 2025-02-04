part of 'weather_period_screen_bloc.dart';

@immutable
sealed class WeatherPeriodScreenEvent {}

final class InitWeatherPeriodEvent extends WeatherPeriodScreenEvent {}

final class SwitchWeatherPeriodEvent extends WeatherPeriodScreenEvent {
  final String location;

  SwitchWeatherPeriodEvent({required this.location});
}
