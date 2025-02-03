import 'package:json_annotation/json_annotation.dart';
import 'package:weather_cast/model/current/condition/condition.dart';
import 'package:weather_cast/model/extension_methods.dart';

import '../../current/current.dart';

part 'hour_forecast.g.dart';

@JsonSerializable()
class HourForecast {
  final String time;
  @JsonKey(name: "temp_c")
  final double tempC;
  @JsonKey(name: "is_day")
  final int isDay;
  final Condition condition;
  @JsonKey(name: "wind_kph")
  final double? windKph;
  @JsonKey(name: "wind_degree")
  final int? windDegree;
  @JsonKey(name: "pressure_mb")
  final double? pressureMb;
  @JsonKey(name: "precip_mm")
  final double? precipMm;
  final int? humidity;
  final int? cloud;
  @JsonKey(name: "feelslike_c")
  final double? feelslikeC;
  @JsonKey(name: "vis_km")
  final double? visKm;
  final double? uv;
  @JsonKey(name: "gust_kph")
  final double? gustKph;

  HourForecast(
      this.time,
      this.tempC,
      this.isDay,
      this.condition,
      this.windKph,
      this.windDegree,
      this.pressureMb,
      this.precipMm,
      this.humidity,
      this.cloud,
      this.feelslikeC,
      this.visKm,
      this.uv,
      this.gustKph);

  factory HourForecast.fromJson(Map<String, dynamic> json) =>
      _$HourForecastFromJson(json);

  Map<String, dynamic> toJson() => _$HourForecastToJson(this);

  List<ConditionParam> toConditionParams() {
    List<ConditionParam> params = [];
    _toMap().forEach((key, value) =>
        params.add(ConditionParam(name: key.getNameOfMeasure(),
          icon: "${key.getNameOfMeasure()}.png",
          value: value,
          unitOfMeasure: key.getMeasure(),))
    );
    return params;
  }

  Map<String, dynamic> _toMap() {
    return <String, dynamic>
    {
      'wind_kph': windKph,
      'wind_degree': windDegree,
      'pressure_mb': pressureMb,
      'precip_mm': precipMm,
      'humidity': humidity,
      'cloud': cloud,
      'vis_km': visKm,
      'uv': uv,
      'gust_kph': gustKph,
    };
  }
}
