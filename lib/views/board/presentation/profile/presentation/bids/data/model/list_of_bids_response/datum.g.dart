// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      id: json['id'] as int?,
      gig: json['gig'] == null
          ? null
          : Gig.fromJson(json['gig'] as Map<String, dynamic>),
      artisan: json['artisan'] == null
          ? null
          : User.fromJson(json['artisan'] as Map<String, dynamic>),
      coverMessage: json['cover_message'] as String?,
      paymentType: json['payment_type'] as String?,
      reference: json['reference'] as String?,
      payableAmount: json['payable_amount'] as int?,
      status: json['status'] as String?,
      declineMessage: json['decline_message'],
      responseDate: json['response_date'],
      attachments: (json['attachments'] as List<dynamic>?)
          ?.map((e) => Attachment.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    )
      ..user = json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>)
      ..industry = json['industry'] == null
          ? null
          : Industry.fromJson(json['industry'] as Map<String, dynamic>)
      ..type = $enumDecodeNullable(_$GigTypeEnumMap, json['type'])
      ..title = json['title'] as String?
      ..description = json['description'] as String?
      ..experienceLevel = json['experience_level'] as int?
      ..coverLetterRequired = json['cover_letter_required'] as int?
      ..serviceDate = json['service_date']
      ..serviceTime = json['service_time']
      ..serviceAddress = json['service_address']
      ..serviceDuration = json['service_duration']
      ..timeline = json['timeline'] as String?
      ..hourlyBudget = json['hourly_budget']
      ..totalBudget = json['total_budget'] as int?
      ..consultancyRate = json['consultancy_rate']
      // ..skills = (json['skills'] as List<Skill>?)
      //     ?.map((e) => Skill.fromJson(e as Map<String, dynamic>))
      //     .toList()
      ..isPublished = json['is_published'] as int?;

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'user': instance.user?.toJson(),
      'industry': instance.industry?.toJson(),
      'type': _$GigTypeEnumMap[instance.type],
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
      'skills': instance.skills?.map((e) => e.toJson()).toList(),
      'is_published': instance.isPublished,
      'id': instance.id,
      'gig': instance.gig?.toJson(),
      'artisan': instance.artisan?.toJson(),
      'cover_message': instance.coverMessage,
      'payment_type': instance.paymentType,
      'reference': instance.reference,
      'payable_amount': instance.payableAmount,
      'status': instance.status,
      'decline_message': instance.declineMessage,
      'response_date': instance.responseDate,
      'attachments': instance.attachments?.map((e) => e.toJson()).toList(),
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

const _$GigTypeEnumMap = {
  GigType.FREELANCE: 'FREELANCE',
  GigType.HOME: 'HOME',
  GigType.LIVE: 'LIVE',
  GigType.UNKNOWN: 'UNKNOWN',
};
