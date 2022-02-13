// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_of_available_gigs_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListOfAvailableGigsResponse _$ListOfAvailableGigsResponseFromJson(
        Map<String, dynamic> json) =>
    ListOfAvailableGigsResponse(
      msg: json['msg'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      success: json['success'] as bool?,
      code: json['code'] as int?,
    )..errorDebug = json['errorDebug'];

Map<String, dynamic> _$ListOfAvailableGigsResponseToJson(
        ListOfAvailableGigsResponse instance) =>
    <String, dynamic>{
      'errorDebug': instance.errorDebug,
      'msg': instance.msg,
      'data': instance.data?.toJson(),
      'success': instance.success,
      'code': instance.code,
    };
