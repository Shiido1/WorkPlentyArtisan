import 'package:equatable/equatable.dart';

class RegisterEntity extends Equatable {
  final String? email;
  final String? fname;
  final String? lname;
  final String? phone;
  final String? password;
  final String? role;

  const RegisterEntity(
      {this.email,
      this.fname,
      this.lname,
      this.phone,
      this.password,
      this.role});

  @override
  List<Object?> get props => [];

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'fname': fname,
      'lname': lname,
      'phone': phone,
      'password': password,
      'role': 'artisan',
    };
  }
}
