import 'package:json_annotation/json_annotation.dart';
part 'astronomy.g.dart';

@JsonSerializable()
class Astronomy {
  final String? sunrise;
  final String? sunset;
  final String? moonrise;
  final String? moonset;
  @JsonKey(name: "moon_phase")
  final String? moonPhase;

  Astronomy(this.sunrise, this.sunset, this.moonrise, this.moonset,
      this.moonPhase);

  factory Astronomy.fromJson(Map<String, dynamic> json) =>
      _$AstronomyFromJson(json);

  Map<String, dynamic> toJson() => _$AstronomyToJson(this);

}
