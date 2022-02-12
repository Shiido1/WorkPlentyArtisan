// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      coverLetter: json['cover_letter'] == null
          ? null
          : CoverLetter.fromJson(json['cover_letter'] as Map<String, dynamic>),
      experienceLevel: json['experience_level'] == null
          ? null
          : ExperienceLevel.fromJson(
              json['experience_level'] as Map<String, dynamic>),
      timeline: json['timeline'] == null
          ? null
          : Timeline.fromJson(json['timeline'] as Map<String, dynamic>),
      paymentType: json['payment_type'] == null
          ? null
          : PaymentType.fromJson(json['payment_type'] as Map<String, dynamic>),
      type: json['type'] == null
          ? null
          : Type.fromJson(json['type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'cover_letter': instance.coverLetter,
      'experience_level': instance.experienceLevel,
      'timeline': instance.timeline,
      'payment_type': instance.paymentType,
      'type': instance.type,
    };
