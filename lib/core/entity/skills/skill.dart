import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'skill.g.dart';

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: 1)
class Skill extends HiveObject {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  @JsonKey(name: 'created_at')
  String? createdAt;

  Skill({this.id, this.name, this.createdAt});

  factory Skill.fromJson(Map<String, dynamic> json) => _$SkillFromJson(json);

  Map<String, dynamic> toJson() => _$SkillToJson(this);
}
