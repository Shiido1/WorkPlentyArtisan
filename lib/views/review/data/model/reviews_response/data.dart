import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';
import 'pagination_meta.dart';

part 'data.g.dart';

@JsonSerializable()
@HiveType(typeId: 1)
class Data {
  @HiveField(0)
  @JsonKey(name: 'pagination_meta')
  PaginationMeta? paginationMeta;
  @HiveField(1)
  List<Datum>? data;

  Data({this.paginationMeta, this.data});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
