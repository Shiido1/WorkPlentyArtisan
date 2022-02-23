// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      id: json['id'] as int?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      profile: json['profile'] == null
          ? null
          : Profile.fromJson(json['profile'] as Map<String, dynamic>),
      industry: json['industry'] == null
          ? null
          : Industry.fromJson(json['industry'] as Map<String, dynamic>),
      type: json['type'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      experienceLevel: json['experience_level'] as int?,
      coverLetterRequired: json['cover_letter_required'] as int?,
      serviceDate: json['service_date'],
      serviceTime: json['service_time'],
      serviceAddress: json['service_address'],
      serviceDuration: json['service_duration'],
      timeline: json['timeline'] as String?,
      hourlyBudget: json['hourly_budget'],
      totalBudget: json['total_budget'] as int?,
      consultancyRate: json['consultancy_rate'],
      projectType: json['project_type'] as String?,
      paymentType: json['payment_type'] as String?,
      totalMilestones: json['total_milestones'] as int?,
      skills: (json['skills'] as List<dynamic>?)
          ?.map((e) => Skill.fromJson(e as Map<String, dynamic>))
          .toList(),
      attachments: (json['attachments'] as List<dynamic>?)
          ?.map((e) => Attachment.fromJson(e as Map<String, dynamic>))
          .toList(),
      bids: json['bids'] as int?,
      interviewing: json['interviewing'] as int?,
      avgRating: json['avg_rating'] as int?,
      milestones: (json['milestones'] as List<dynamic>?)
          ?.map((e) => Milestone.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      gig: json['gig'] == null
          ? null
          : Gig.fromJson(json['gig'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'id': instance.id,
      'user': instance.user?.toJson(),
      'profile': instance.profile?.toJson(),
      'industry': instance.industry?.toJson(),
      'type': instance.type,
      'title': instance.title,
      'description': instance.description,
      'experience_level': instance.experienceLevel,
      'cover_letter_required': instance.coverLetterRequired,
      'service_date': instance.serviceDate,
      'service_time': instance.serviceTime,
      'service_address': instance.serviceAddress,
      'service_duration': instance.serviceDuration,
      'timeline': instance.timeline,
      'hourly_budget': instance.hourlyBudget,
      'total_budget': instance.totalBudget,
      'consultancy_rate': instance.consultancyRate,
      'project_type': instance.projectType,
      'payment_type': instance.paymentType,
      'total_milestones': instance.totalMilestones,
      'skills': instance.skills?.map((e) => e.toJson()).toList(),
      'attachments': instance.attachments?.map((e) => e.toJson()).toList(),
      'bids': instance.bids,
      'interviewing': instance.interviewing,
      'avg_rating': instance.avgRating,
      'milestones': instance.milestones?.map((e) => e.toJson()).toList(),
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'gig': instance.gig?.toJson(),
    };
