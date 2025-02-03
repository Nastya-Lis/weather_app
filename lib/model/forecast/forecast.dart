import 'package:json_annotation/json_annotation.dart';
import 'package:weather_cast/model/forecast/astro/astronomy.dart';

import 'hour_forecast/hour_forecast.dart';

part 'forecast.g.dart';

@JsonSerializable()
class Forecast {
  final String date;
  @JsonKey(name: "astro")
  final Astronomy? astronomy;

  final List<HourForecast>? hour;

  Forecast(this.hour, this.date, {required this.astronomy});

  factory Forecast.fromJson(Map<String, dynamic> json) =>
      _$ForecastFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastToJson(this);
}
