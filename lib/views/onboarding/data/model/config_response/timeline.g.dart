// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timeline.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Timeline _$TimelineFromJson(Map<String, dynamic> json) => Timeline(
      label: json['label'] as String?,
      option: (json['option'] as List<dynamic>?)
          ?.map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TimelineToJson(Timeline instance) => <String, dynamic>{
      'label': instance.label,
      'option': instance.option?.map((e) => e.toJson()).toList(),
    };
