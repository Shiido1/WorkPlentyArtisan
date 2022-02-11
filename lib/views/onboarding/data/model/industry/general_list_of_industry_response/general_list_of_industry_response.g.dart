// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'general_list_of_industry_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeneralListOfIndustryResponse _$GeneralListOfIndustryResponseFromJson(
        Map<String, dynamic> json) =>
    GeneralListOfIndustryResponse(
      msg: json['msg'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
      success: json['success'] as bool?,
      code: json['code'] as int?,
    );

Map<String, dynamic> _$GeneralListOfIndustryResponseToJson(
        GeneralListOfIndustryResponse instance) =>
    <String, dynamic>{
      'msg': instance.msg,
      'data': instance.data,
      'success': instance.success,
      'code': instance.code,
    };
