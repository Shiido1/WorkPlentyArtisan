// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cover_letter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoverLetter _$CoverLetterFromJson(Map<String, dynamic> json) => CoverLetter(
      label: json['label'] as String?,
      option: (json['option'] as List<dynamic>?)
          ?.map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CoverLetterToJson(CoverLetter instance) =>
    <String, dynamic>{
      'label': instance.label,
      'option': instance.option,
    };
