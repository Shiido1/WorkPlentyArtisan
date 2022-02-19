import 'package:artisan/core/entity/attachments/attachment.dart';
import 'package:artisan/core/entity/industry/industry.dart';
import 'package:artisan/core/entity/skills/skill.dart';
import 'package:artisan/core/entity/user/user.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'gig.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: true)
@HiveType(typeId: 0)
class Gig extends HiveObject {
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
  int? experienceLevel;
  @HiveField(7)
  @JsonKey(name: 'cover_letter_required')
  int? coverLetterRequired;
  @HiveField(8)
  @JsonKey(name: 'service_date')
  dynamic serviceDate;
  @HiveField(9)
  @JsonKey(name: 'service_time')
  dynamic serviceTime;
  @HiveField(10)
  @JsonKey(name: 'service_address')
  dynamic serviceAddress;
  @HiveField(11)
  @JsonKey(name: 'service_duration')
  dynamic serviceDuration;
  @HiveField(12)
  String? timeline;
  @HiveField(13)
  @JsonKey(name: 'hourly_budget')
  dynamic hourlyBudget;
  @HiveField(14)
  @JsonKey(name: 'total_budget')
  int? totalBudget;
  @HiveField(15)
  @JsonKey(name: 'consultancy_rate')
  dynamic consultancyRate;
  @HiveField(16)
  @JsonKey(name: 'payment_type')
  String? paymentType;
  @HiveField(17)
  List<Skill>? skills = [];
  @HiveField(18)
  List<Attachment>? attachments;
  @HiveField(19)
  @JsonKey(name: 'is_published')
  int? isPublished;
  @HiveField(20)
  @JsonKey(name: 'created_at')
  String? createdAt;
  @HiveField(21)
  @JsonKey(name: 'updated_at')
  String? updatedAt;

  Gig({
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

  factory Gig.fromJson(Map<String, dynamic> json) => _$GigFromJson(json);

  Map<String, dynamic> toJson() => _$GigToJson(this);
}
