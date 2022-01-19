// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'default_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DefaultResponse _$DefaultResponseFromJson(Map<String, dynamic> json) =>
    DefaultResponse(
      msg: json['msg'] as String?,
      data: json['data'],
      success: json['success'] as bool?,
      code: json['code'] as int?,
    );

Map<String, dynamic> _$DefaultResponseToJson(DefaultResponse instance) =>
    <String, dynamic>{
      'msg': instance.msg,
      'data': instance.data,
      'success': instance.success,
      'code': instance.code,
    };
