// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'condition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Condition _$ConditionFromJson(Map<String, dynamic> json) => Condition(
      json['icon'] as String?,
      json['text'] as String?,
      (json['code'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ConditionToJson(Condition instance) => <String, dynamic>{
      'icon': instance.icon,
      'text': instance.text,
      'code': instance.code,
    };
