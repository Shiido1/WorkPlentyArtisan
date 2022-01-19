import 'package:artisan/core/entity/user/user.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data extends Equatable {
  final String? token;
  @JsonKey(name: 'token_type')
  final String? tokenType;
  final User? user;

  const Data({this.token, this.tokenType, this.user});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [token, tokenType, user];
}
