import 'package:json_annotation/json_annotation.dart';

part 'cover.g.dart';

@JsonSerializable()
class Cover {
  int? id;
  String? name;
  String? path;
  dynamic mimetype;
  String? size;
  @JsonKey(name: 'formatted_size')
  String? formattedSize;
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
