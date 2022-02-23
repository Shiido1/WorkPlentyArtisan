import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entity/auth_entity.dart';
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
