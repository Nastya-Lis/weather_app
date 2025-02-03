import 'package:json_annotation/json_annotation.dart';
part 'location.g.dart';

@JsonSerializable()
class Location {
  String? name;
  String? region;
  String? country;
  @JsonKey(name: "lat")
  double? latitude;
  @JsonKey(name: "lon")
  double? longitude;
  String? localTime;

  Location(this.name, this.region, this.country, this.latitude, this.longitude,
      this.localTime);

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);

}
