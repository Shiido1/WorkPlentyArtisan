import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'industry.g.dart';

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: 2)
class Industry extends HiveObject {
  @HiveField(0)
  int? id;
  @JsonKey(name: 'category_id')
  @HiveField(1)
  dynamic categoryId;
  @HiveField(2)
  String? name;
  @JsonKey(name: 'created_at')
  @HiveField(3)
  dynamic createdAt;

  Industry({this.id, this.categoryId, this.name, this.createdAt});

  factory Industry.fromJson(Map<String, dynamic> json) {
    return _$IndustryFromJson(json);
  }

  Map<String, dynamic> toJson() => _$IndustryToJson(this);
}
