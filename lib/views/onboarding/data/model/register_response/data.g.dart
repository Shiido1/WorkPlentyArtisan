// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      token: json['token'] as String?,
      tokenType: json['token_type'] as String?,
      user: json['user'],
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'token': instance.token,
      'token_type': instance.tokenType,
      'user': instance.user,
    };
