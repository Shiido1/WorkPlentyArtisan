import 'package:json_annotation/json_annotation.dart';

part 'profile.g.dart';

@JsonSerializable()
class Profile {
  int? id;
  String? description;
  dynamic dob;
  String? gender;
  dynamic languages;
  dynamic country;
  dynamic state;
  dynamic city;
  dynamic address;
  dynamic apartment;
  dynamic zipcode;
  @JsonKey(name: 'experience_level')
  dynamic experienceLevel;
  @JsonKey(name: 'approval_status')
  int? approvalStatus;
  @JsonKey(name: 'weekly_hours')
  dynamic weeklyHours;
  int? reviews;
  @JsonKey(name: 'avg_rating')
  int? avgRating;
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
