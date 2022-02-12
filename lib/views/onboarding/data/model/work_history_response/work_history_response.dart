// ignore_for_file: must_be_immutable

import 'package:artisan/core/entity/default_response.dart';
import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'work_history_response.g.dart';

@JsonSerializable()
class WorkHistoryResponse extends DefaultResponse {
  String? msg;
  List<Datum>? data;
  bool? success;
  int? code;

  WorkHistoryResponse({this.msg, this.data, this.success, this.code});

  factory WorkHistoryResponse.fromJson(Map<String, dynamic> json) {
    return _$WorkHistoryResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WorkHistoryResponseToJson(this);
}
