// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      paginationMeta: json['pagination_meta'] == null
          ? null
          : PaginationMeta.fromJson(
              json['pagination_meta'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'pagination_meta': instance.paginationMeta?.toJson(),
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };
