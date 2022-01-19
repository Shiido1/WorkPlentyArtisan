import 'package:equatable/equatable.dart';

class ResetPasswordEntity extends Equatable {
  final String? email;
  final String? pin;
  final String? password;

  const ResetPasswordEntity({this.email, this.pin, this.password});

  @override
  List<Object?> get props => [];

  Map<String, dynamic> toMap() {
    return {'email': email, 'pin': pin, 'password': password};
  }
}
