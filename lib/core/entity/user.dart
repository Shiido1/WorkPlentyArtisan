import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class User extends Equatable {
  final int? id;
  final String? avatar;
  final String? fname;
  final dynamic mname;
  final String? lname;
  final String? email;
  final String? phone;
  final String? role;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  const User({
    this.id,
    this.avatar,
    this.fname,
    this.mname,
    this.lname,
    this.email,
    this.phone,
    this.role,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      avatar,
      fname,
      mname,
      lname,
      email,
      phone,
      role,
      createdAt,
      updatedAt,
    ];
  }
}
