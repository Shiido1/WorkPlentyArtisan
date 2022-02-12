// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      id: json['id'] as int?,
      name: json['name'] as String?,
    )
      ..msg = json['msg'] as String?
      ..code = json['code'] as int?
      ..success = json['success'] as bool?
      ..errorDebug = json['errorDebug'];

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'msg': instance.msg,
      'code': instance.code,
      'success': instance.success,
      'errorDebug': instance.errorDebug,
      'id': instance.id,
      'name': instance.name,
    };
