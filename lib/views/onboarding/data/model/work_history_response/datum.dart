import 'package:json_annotation/json_annotation.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum {
  int? id;
  @JsonKey(name: 'user_id')
  int? userId;
  String? company;
  String? location;
  String? position;
  @JsonKey(name: 'started_on')
  String? startedOn;
  @JsonKey(name: 'ended_on')
  String? endedOn;
  @JsonKey(name: 'currently_here')
  int? currentlyHere;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;

  Datum({
    this.id,
    this.userId,
    this.company,
    this.location,
    this.position,
    this.startedOn,
    this.endedOn,
    this.currentlyHere,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}
