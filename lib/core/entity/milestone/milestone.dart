import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'milestone.g.dart';

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: 0)
class Milestone extends HiveObject {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? description;
  @HiveField(2)
  @JsonKey(name: 'due_date')
  String? dueDate;
  @HiveField(3)
  int? amount;
  @JsonKey(name: 'created_at')
  @HiveField(4)
  String? createdAt;

  Milestone({
    this.id,
    this.description,
    this.dueDate,
    this.amount,
    this.createdAt,
  });

  factory Milestone.fromJson(Map<String, dynamic> json) {
    return _$MilestoneFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MilestoneToJson(this);
}
