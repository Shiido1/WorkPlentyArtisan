import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile.g.dart';

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: 0)
class Profile extends HiveObject {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? description;
  @HiveField(2)
  dynamic dob;
  @HiveField(3)
  String? gender;
  @HiveField(4)
  dynamic languages;
  @HiveField(5)
  dynamic country;
  @HiveField(6)
  dynamic state;
  @HiveField(7)
  dynamic city;
  @HiveField(8)
  dynamic address;
  @HiveField(9)
  dynamic apartment;
  @HiveField(10)
  dynamic zipcode;
  @HiveField(11)
  @JsonKey(name: 'experience_level')
  int? experienceLevel;
  @HiveField(12)
  @JsonKey(name: 'approval_status')
  int? approvalStatus;
  @HiveField(13)
  @JsonKey(name: 'weekly_hours')
  dynamic weeklyHours;
  @HiveField(14)
  int? reviews;
  @HiveField(15)
  @JsonKey(name: 'avg_rating')
  int? avgRating;
  @HiveField(16)
  @JsonKey(name: 'job_posted')
  int? jobPosted;

  Profile({
    this.id,
    this.description,
    this.dob,
    this.gender,
    this.languages,
    this.country,
    this.state,
    this.city,
    this.address,
    this.apartment,
    this.zipcode,
    this.experienceLevel,
    this.approvalStatus,
    this.weeklyHours,
    this.reviews,
    this.avgRating,
    this.jobPosted,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return _$ProfileFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
