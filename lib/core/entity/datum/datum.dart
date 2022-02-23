import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../../../core/entity/industry/industry.dart';
import '../../../../../../core/entity/profile/profile.dart';
import '../../../../../../core/entity/user/user.dart';
import '../../enums/gig_type.dart';
import '../attachments/attachment.dart';
import '../gig/gig.dart';
import '../milestone/milestone.dart';
import '../skills/skill.dart';

part 'datum.g.dart';

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: 0)
class Datum {
  @HiveField(0)
  int? id;
  @HiveField(1)
  User? user;
  @HiveField(2)
  Profile? profile;
  @HiveField(3)
  Industry? industry;
  @HiveField(4)
  GigType? type;
  @HiveField(5)
  String? title;
  @HiveField(6)
  String? description;
  @HiveField(7)
  @JsonKey(name: 'experience_level')
  int? experienceLevel;
  @HiveField(8)
  @JsonKey(name: 'cover_letter_required')
  int? coverLetterRequired;
  @HiveField(9)
  @JsonKey(name: 'service_date')
  dynamic serviceDate;
  @HiveField(10)
  @JsonKey(name: 'service_time')
  dynamic serviceTime;
  @HiveField(11)
  @JsonKey(name: 'service_address')
  dynamic serviceAddress;
  @HiveField(12)
  @JsonKey(name: 'service_duration')
  dynamic serviceDuration;
  @HiveField(13)
  String? timeline;
  @HiveField(14)
  @JsonKey(name: 'hourly_budget')
  dynamic hourlyBudget;
  @HiveField(15)
  @JsonKey(name: 'total_budget')
  int? totalBudget;
  @HiveField(16)
  @JsonKey(name: 'consultancy_rate')
  dynamic consultancyRate;
  @HiveField(17)
  @JsonKey(name: 'project_type')
  String? projectType;
  @HiveField(18)
  @JsonKey(name: 'payment_type')
  String? paymentType;
  @HiveField(19)
  @JsonKey(name: 'total_milestones')
  int? totalMilestones;
  @HiveField(20)
  List<Skill>? skills;
  @HiveField(21)
  List<Attachment>? attachments;
  @HiveField(22)
  int? bids;
  @HiveField(23)
  int? interviewing;
  @HiveField(24)
  @JsonKey(name: 'avg_rating')
  int? avgRating;
  @HiveField(25)
  List<Milestone>? milestones;
  @HiveField(26)
  @JsonKey(name: 'created_at')
  String? createdAt;
  @HiveField(27)
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  @HiveField(1)
  Gig? gig;

  Datum({
    this.id,
    this.user,
    this.profile,
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
    this.projectType,
    this.paymentType,
    this.totalMilestones,
    this.skills,
    this.attachments,
    this.bids,
    this.interviewing,
    this.avgRating,
    this.milestones,
    this.createdAt,
    this.updatedAt,
    this.gig
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}
