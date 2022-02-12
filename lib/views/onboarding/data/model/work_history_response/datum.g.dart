// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      id: json['id'] as int?,
      userId: json['user_id'] as int?,
      company: json['company'] as String?,
      location: json['location'] as String?,
      position: json['position'] as String?,
      startedOn: json['started_on'] as String?,
      endedOn: json['ended_on'] as String?,
      currentlyHere: json['currently_here'] as int?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'company': instance.company,
      'location': instance.location,
      'position': instance.position,
      'started_on': instance.startedOn,
      'ended_on': instance.endedOn,
      'currently_here': instance.currentlyHere,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
