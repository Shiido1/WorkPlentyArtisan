import 'package:artisan/core/entity/default_response.dart';
import 'package:artisan/core/helper/configs/instances.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'skills_response.g.dart';

@JsonSerializable()
class SkillsResponse extends DefaultResponse {
  final String? msg;
  final List<Datum>? data;
  final bool? success;
  final int? code;

  SkillsResponse({this.msg, this.data, this.success, this.code});

  factory SkillsResponse.fromJson(Map<String, dynamic> json) {
    return _$SkillsResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SkillsResponseToJson(this);

  @override
  List<Object?> get props => [msg, data, success, code];
}
