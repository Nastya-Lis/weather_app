import 'package:json_annotation/json_annotation.dart';
import 'package:weather_cast/model/extension_methods.dart';

import 'condition/condition.dart';

part 'current.g.dart';

@JsonSerializable()
class CurrentWeather {
  @JsonKey(name: "last_updated_epoch")
  final int? lastUpdatedEpoch;
  @JsonKey(name: "last_updated")
  final String? lastUpdated;
  final Condition? condition;
  @JsonKey(name: "temp_c")
  final double? tempC;
  @JsonKey(name: "is_day")
  final int? isDay;
  @JsonKey(name: "wind_kph")
  final double? windKph;
  @JsonKey(name: "wind_degree")
  final int? windDegree;

  /*@JsonKey(name: "wind_dir")
  final String? windDir;*/
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

  CurrentWeather(this.lastUpdatedEpoch,
      this.lastUpdated,
      this.condition,
      this.tempC,
      this.isDay,
      this.windKph,
      this.windDegree,
      //this.windDir,
      this.pressureMb,
      this.precipMm,
      this.humidity,
      this.cloud,
      this.feelslikeC,
      this.visKm,
      this.uv,
      this.gustKph,);

  factory CurrentWeather.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentWeatherToJson(this);

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

class ConditionParam {
  final String name;
  final String icon;
  final dynamic value;
  final String unitOfMeasure;

  ConditionParam({
    required this.name,
    required this.icon,
    required this.value,
    required this.unitOfMeasure,});
}
