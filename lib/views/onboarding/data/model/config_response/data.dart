import 'package:json_annotation/json_annotation.dart';

import 'cover_letter.dart';
import 'experience_level.dart';
import 'payment_type.dart';
import 'timeline.dart';
import 'type.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  @JsonKey(name: 'cover_letter')
  CoverLetter? coverLetter;
  @JsonKey(name: 'experience_level')
  ExperienceLevel? experienceLevel;
  Timeline? timeline;
  @JsonKey(name: 'payment_type')
  PaymentType? paymentType;
  Type? type;

  Data({
    this.coverLetter,
    this.experienceLevel,
    this.timeline,
    this.paymentType,
    this.type,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
