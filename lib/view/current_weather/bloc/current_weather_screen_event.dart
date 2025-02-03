part of 'current_weather_screen_bloc.dart';

class CurrentWeatherScreenEvent {}

class InitCurrentWeatherScreenEvent extends CurrentWeatherScreenEvent {}

class SwitchLocationWeatherScreenEvent extends CurrentWeatherScreenEvent {
  final String nameLocation;

  SwitchLocationWeatherScreenEvent(this.nameLocation);
}

class UpdateCurrentWeatherScreenEvent extends CurrentWeatherScreenEvent {}

class GeoLocatorCurrentWeatherScreenEvent extends CurrentWeatherScreenEvent {}
