import 'package:json_annotation/json_annotation.dart';

import '../../../../../core/entity/profile/profile.dart';
import '../../../../../core/entity/user/user.dart';

part 'data.g.dart';

@JsonSerializable(explicitToJson: true)
class Data {
  String? token;
  @JsonKey(name: 'token_type')
  String? tokenType;
  User? user;
  Profile? profile;

  Data({this.token, this.tokenType, this.user, this.profile});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
