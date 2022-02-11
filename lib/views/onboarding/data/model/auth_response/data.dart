import 'package:artisan/core/entity/user/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable(explicitToJson: true)
class Data {
  String? token;
  @JsonKey(name: 'token_type')
  String? tokenType;
  User? user;

  Data({this.token, this.tokenType, this.user});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
