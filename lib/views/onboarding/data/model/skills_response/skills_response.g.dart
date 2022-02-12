// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skills_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SkillsResponse _$SkillsResponseFromJson(Map<String, dynamic> json) =>
    SkillsResponse(
      msg: json['msg'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
      success: json['success'] as bool?,
      code: json['code'] as int?,
    );

Map<String, dynamic> _$SkillsResponseToJson(SkillsResponse instance) =>
    <String, dynamic>{
      'msg': instance.msg,
      'data': instance.data,
      'success': instance.success,
      'code': instance.code,
    };
