import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse extends Equatable {
  final String? msg;
  final Data? data;
  final bool? success;
  final int? code;

  const LoginResponse({this.msg, this.data, this.success, this.code});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return _$LoginResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [msg, data, success, code];
}
