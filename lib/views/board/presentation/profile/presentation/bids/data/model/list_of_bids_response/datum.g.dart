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
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
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
