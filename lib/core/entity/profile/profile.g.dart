// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      id: json['id'] as int?,
      description: json['description'] as String?,
      dob: json['dob'],
      gender: json['gender'] as String?,
      languages: json['languages'],
      country: json['country'],
      state: json['state'],
      city: json['city'],
      address: json['address'],
      apartment: json['apartment'],
      zipcode: json['zipcode'],
      experienceLevel: json['experience_level'] as int?,
      approvalStatus: json['approval_status'] as int?,
      weeklyHours: json['weekly_hours'],
      reviews: json['reviews'] as int?,
      avgRating: json['avg_rating'] as int?,
      jobPosted: json['job_posted'] as int?,
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'dob': instance.dob,
      'gender': instance.gender,
      'languages': instance.languages,
      'country': instance.country,
      'state': instance.state,
      'city': instance.city,
      'address': instance.address,
      'apartment': instance.apartment,
      'zipcode': instance.zipcode,
      'experience_level': instance.experienceLevel,
      'approval_status': instance.approvalStatus,
      'weekly_hours': instance.weeklyHours,
      'reviews': instance.reviews,
      'avg_rating': instance.avgRating,
      'job_posted': instance.jobPosted,
    };
