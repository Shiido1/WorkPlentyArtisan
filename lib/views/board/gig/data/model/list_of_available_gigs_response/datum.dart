import 'package:artisan/core/entity/attachments/attachment.dart';
import 'package:artisan/core/entity/industry/industry.dart';
import 'package:artisan/core/entity/skills/skill.dart';
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
  User? user;
  @HiveField(2)
  Industry? industry;
  @HiveField(3)
  String? type;
  @HiveField(4)
  String? title;
  @HiveField(5)
  String? description;
  @HiveField(6)
  @JsonKey(name: 'experience_level')
  @HiveField(7)
  int? experienceLevel;
  @HiveField(8)
  @JsonKey(name: 'cover_letter_required')
  @HiveField(9)
  int? coverLetterRequired;
  @HiveField(10)
  @JsonKey(name: 'service_date')
  @HiveField(11)
  dynamic serviceDate;
  @HiveField(12)
  @JsonKey(name: 'service_time')
  dynamic serviceTime;
  @HiveField(13)
  @JsonKey(name: 'service_address')
  dynamic serviceAddress;
  @HiveField(14)
  @JsonKey(name: 'service_duration')
  dynamic serviceDuration;
  String? timeline;
  @HiveField(15)
  @JsonKey(name: 'hourly_budget')
  dynamic hourlyBudget;
  @HiveField(16)
  @JsonKey(name: 'total_budget')
  int? totalBudget;
  @HiveField(17)
  @JsonKey(name: 'consultancy_rate')
  dynamic consultancyRate;
  @HiveField(18)
  @JsonKey(name: 'payment_type')
  String? paymentType;
  @HiveField(19)
  List<Skill>? skills;
  @HiveField(20)
  List<Attachment>? attachments;
  @HiveField(21)
  @JsonKey(name: 'is_published')
  int? isPublished;
  @HiveField(22)
  @JsonKey(name: 'created_at')
  String? createdAt;
  @HiveField(23)
  @JsonKey(name: 'updated_at')
  String? updatedAt;

  Datum({
    this.id,
    this.user,
    this.industry,
    this.type,
    this.title,
    this.description,
    this.experienceLevel,
    this.coverLetterRequired,
    this.serviceDate,
    this.serviceTime,
    this.serviceAddress,
    this.serviceDuration,
    this.timeline,
    this.hourlyBudget,
    this.totalBudget,
    this.consultancyRate,
    this.paymentType,
    this.skills,
    this.attachments,
    this.isPublished,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}
