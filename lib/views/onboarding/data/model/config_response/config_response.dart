// ignore_for_file: must_be_immutable

import 'package:artisan/core/entity/default_response.dart';
import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'config_response.g.dart';

@JsonSerializable()
class ConfigResponse extends DefaultResponse {
  String? msg;
  Data? data;
  bool? success;
  int? code;

  ConfigResponse({this.msg, this.data, this.success, this.code});

  factory ConfigResponse.fromJson(Map<String, dynamic> json) {
    return _$ConfigResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ConfigResponseToJson(this);
}
