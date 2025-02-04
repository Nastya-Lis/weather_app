import 'package:json_annotation/json_annotation.dart';
import 'package:weather_cast/model/current/current.dart';
import 'package:weather_cast/model/location/location.dart';

part 'weather_model.g.dart';

@JsonSerializable()
class Weather {
  final Location? location;
  final CurrentWeather? current;

  Weather(
    this.location,
    this.current,
  );

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}
