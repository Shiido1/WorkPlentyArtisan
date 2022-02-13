import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cover.g.dart';

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: 1)
class Cover extends HiveObject {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? path;
  @HiveField(3)
  dynamic mimetype;
  @HiveField(4)
  String? size;
  @HiveField(5)
  @JsonKey(name: 'formatted_size')
  String? formattedSize;
  @HiveField(5)
  @JsonKey(name: 'created_at')
  String? createdAt;

  Cover({
    this.id,
    this.name,
    this.path,
    this.mimetype,
    this.size,
    this.formattedSize,
    this.createdAt,
  });

  factory Cover.fromJson(Map<String, dynamic> json) => _$CoverFromJson(json);

  Map<String, dynamic> toJson() => _$CoverToJson(this);
}
