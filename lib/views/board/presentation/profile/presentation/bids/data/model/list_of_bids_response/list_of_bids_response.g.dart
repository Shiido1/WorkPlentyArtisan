// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_of_bids_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListOfBidsResponse _$ListOfBidsResponseFromJson(Map<String, dynamic> json) =>
    ListOfBidsResponse(
      msg: json['msg'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      success: json['success'] as bool?,
      code: json['code'] as int?,
    )..errorDebug = json['errorDebug'];

Map<String, dynamic> _$ListOfBidsResponseToJson(ListOfBidsResponse instance) =>
    <String, dynamic>{
      'errorDebug': instance.errorDebug,
      'msg': instance.msg,
      'data': instance.data?.toJson(),
      'success': instance.success,
      'code': instance.code,
    };
