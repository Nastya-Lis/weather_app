// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentWeather _$CurrentWeatherFromJson(Map<String, dynamic> json) =>
    CurrentWeather(
      (json['last_updated_epoch'] as num?)?.toInt(),
      json['last_updated'] as String?,
      json['condition'] == null
          ? null
          : Condition.fromJson(json['condition'] as Map<String, dynamic>),
      (json['temp_c'] as num?)?.toDouble(),
      (json['is_day'] as num?)?.toInt(),
      (json['wind_kph'] as num?)?.toDouble(),
      (json['wind_degree'] as num?)?.toInt(),
      (json['pressure_mb'] as num?)?.toDouble(),
      (json['precip_mm'] as num?)?.toDouble(),
      (json['humidity'] as num?)?.toInt(),
      (json['cloud'] as num?)?.toInt(),
      (json['feelslike_c'] as num?)?.toDouble(),
      (json['vis_km'] as num?)?.toDouble(),
      (json['uv'] as num?)?.toDouble(),
      (json['gust_kph'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CurrentWeatherToJson(CurrentWeather instance) =>
    <String, dynamic>{
      'last_updated_epoch': instance.lastUpdatedEpoch,
      'last_updated': instance.lastUpdated,
      'condition': instance.condition,
      'temp_c': instance.tempC,
      'is_day': instance.isDay,
      'wind_kph': instance.windKph,
      'wind_degree': instance.windDegree,
      'pressure_mb': instance.pressureMb,
      'precip_mm': instance.precipMm,
      'humidity': instance.humidity,
      'cloud': instance.cloud,
      'feelslike_c': instance.feelslikeC,
      'vis_km': instance.visKm,
      'uv': instance.uv,
      'gust_kph': instance.gustKph,
    };
