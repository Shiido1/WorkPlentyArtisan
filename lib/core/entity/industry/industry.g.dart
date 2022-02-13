// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'industry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Industry _$IndustryFromJson(Map<String, dynamic> json) => Industry(
      id: json['id'] as int?,
      categoryId: json['category_id'],
      name: json['name'] as String?,
      createdAt: json['created_at'],
    );

Map<String, dynamic> _$IndustryToJson(Industry instance) => <String, dynamic>{
      'id': instance.id,
      'category_id': instance.categoryId,
      'name': instance.name,
      'created_at': instance.createdAt,
    };
