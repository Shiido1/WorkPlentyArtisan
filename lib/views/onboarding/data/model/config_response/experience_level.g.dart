// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'experience_level.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExperienceLevel _$ExperienceLevelFromJson(Map<String, dynamic> json) =>
    ExperienceLevel(
      label: json['label'] as String?,
      option: (json['option'] as List<dynamic>?)
          ?.map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ExperienceLevelToJson(ExperienceLevel instance) =>
    <String, dynamic>{
      'label': instance.label,
      'option': instance.option?.map((e) => e.toJson()).toList(),
    };
