// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attachment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Attachment _$AttachmentFromJson(Map<String, dynamic> json) => Attachment(
      id: json['id'] as int?,
      name: json['name'] as String?,
      path: json['path'] as String?,
      mimetype: json['mimetype'],
      size: json['size'] as String?,
      formattedSize: json['formatted_size'] as String?,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$AttachmentToJson(Attachment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'path': instance.path,
      'mimetype': instance.mimetype,
      'size': instance.size,
      'formatted_size': instance.formattedSize,
      'created_at': instance.createdAt,
    };
