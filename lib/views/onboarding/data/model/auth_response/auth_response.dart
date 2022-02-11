// ignore_for_file: must_be_immutable

import 'package:artisan/views/onboarding/domain/entity/auth_entity.dart';
import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'auth_response.g.dart';

@JsonSerializable(explicitToJson: true)
class AuthResponse extends AuthEntity {
  String? msg;
  Data? data;
  bool? success;
  int? code;

  AuthResponse({this.msg, this.data, this.success, this.code});

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return _$AuthResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);
}
