// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'industry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Industry _$IndustryFromJson(Map<String, dynamic> json) => Industry(
      id: json['id'] as int?,
      name: json['name'] as String?,
      cover: json['cover'] == null
          ? null
          : Cover.fromJson(json['cover'] as Map<String, dynamic>),
      categoryId: json['category_id'],
    );

Map<String, dynamic> _$IndustryToJson(Industry instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'cover': instance.cover?.toJson(),
      'category_id': instance.categoryId,
    };
