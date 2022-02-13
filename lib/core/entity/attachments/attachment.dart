import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'attachment.g.dart';

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: 3)
class Attachment extends HiveObject {
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
  @JsonKey(name: 'formatted_size')
  @HiveField(5)
  String? formattedSize;
  @JsonKey(name: 'created_at')
  @HiveField(6)
  String? createdAt;

  Attachment({
    this.id,
    this.name,
    this.path,
    this.mimetype,
    this.size,
    this.formattedSize,
    this.createdAt,
  });

  factory Attachment.fromJson(Map<String, dynamic> json) {
    return _$AttachmentFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AttachmentToJson(this);
}
