import 'package:artisan/views/onboarding/domain/entity/register_entity.dart';
import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'register_response.g.dart';

@JsonSerializable(explicitToJson: true)
class RegisterResponse extends RegisterEntity {
  final String? msg;
  final Data? data;
  final bool? success;
  final int? code;

  const RegisterResponse({this.msg, this.data, this.success, this.code});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return _$RegisterResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RegisterResponseToJson(this);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [msg, data, success, code];
}
