import 'package:artisan/views/onboarding/domain/entity/forgot_password_entity.dart';

import 'package:json_annotation/json_annotation.dart';

part 'default_response.g.dart';

@JsonSerializable(explicitToJson: true)
class DefaultResponse extends ForgotPasswordEntity {
  final String? msg;
  final dynamic data;
  final bool? success;
  final int? code;

  const DefaultResponse({this.msg, this.data, this.success, this.code});

  factory DefaultResponse.fromJson(Map<String, dynamic> json) {
    return _$DefaultResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DefaultResponseToJson(this);

  @override
  List<Object?> get props => [msg, data, success, code];
}
