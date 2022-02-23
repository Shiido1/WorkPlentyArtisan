import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

import '../cover/cover.dart';

part 'industry.g.dart';

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: 0)
class Industry extends HiveObject {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  Cover? cover;
  @JsonKey(name: 'category_id')
  @HiveField(3)
  dynamic categoryId;

  Industry({this.id, this.name, this.cover, this.categoryId});

  factory Industry.fromJson(Map<String, dynamic> json) {
    return _$IndustryFromJson(json);
  }

  Map<String, dynamic> toJson() => _$IndustryToJson(this);
}
