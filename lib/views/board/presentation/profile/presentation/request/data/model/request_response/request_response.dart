import 'package:artisan/core/entity/default_response.dart';
import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'request_response.g.dart';

@JsonSerializable()
class RequestResponse extends DefaultResponse {
  String? msg;
  Data? data;
  bool? success;
  int? code;

  RequestResponse({this.msg, this.data, this.success, this.code});

  factory RequestResponse.fromJson(Map<String, dynamic> json) {
    return _$RequestResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RequestResponseToJson(this);
}
