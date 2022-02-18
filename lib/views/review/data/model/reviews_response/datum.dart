import 'package:artisan/core/entity/user/user.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'datum.g.dart';

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: 0)
class Datum extends HiveObject {
  @HiveField(0)
  int? id;
  @HiveField(1)
  User? reviewer;
  @HiveField(2)
  int? rating;
  @HiveField(3)
  String? comment;
  @HiveField(4)
  @JsonKey(name: 'created_at')
  String? createdAt;
  @HiveField(5)
  @JsonKey(name: 'updated_at')
  String? updatedAt;

  Datum({
    this.id,
    this.reviewer,
    this.rating,
    this.comment,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}
