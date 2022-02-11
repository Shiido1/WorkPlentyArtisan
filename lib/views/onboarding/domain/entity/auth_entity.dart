// ignore_for_file: must_be_immutable

import 'package:artisan/core/entity/default_response.dart';

class AuthEntity extends DefaultResponse {
  final String? email;
  final String? password;
  final String? firstName;
  final String? lastName;
  final String? phone;
  final String? role;
  final String? username;
  final String? pin;

  AuthEntity(
      {this.email,
      this.password,
      this.firstName,
      this.lastName,
      this.phone,
      this.role,
      this.username,
      this.pin});

  @override
  List<Object> get props => [email!, password!];

  Map<String, dynamic> toRegister() {
    return {
      'email': email,
      'password': password,
      'first_name': firstName,
      'last_name': lastName,
      'username': username,
      'phone': phone,
      'role': 'artisan'
    };
  }

  Map<String, dynamic> toLogin() {
    return {'email': email, 'password': password};
  }

  Map<String, dynamic> forgotPassword() {
    return {'email': email};
  }

  Map<String, dynamic> resetNewPassword() {
    return {'email': email, 'pin': pin, 'password': password};
  }

  Map<String, dynamic> verifyPIN() {
    return {'pin': pin};
  }

  @override
  String toString() => 'AuthEntity(email: $email, password: $password)';
}
