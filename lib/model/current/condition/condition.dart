import 'package:json_annotation/json_annotation.dart';
part 'condition.g.dart';

@JsonSerializable()
class Condition {
  final String? icon;
  final String? text;
  final int? code;

  Condition(this.icon, this.text, this.code);

  factory Condition.fromJson(Map<String, dynamic> json) =>
      _$ConditionFromJson(json);

  Map<String, dynamic> toJson() => _$ConditionToJson(this);
}
