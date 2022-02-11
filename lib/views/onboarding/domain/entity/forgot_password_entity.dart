import 'package:artisan/views/onboarding/domain/entity/reset_password_entity.dart';

class ForgotPasswordEntity extends ResetPasswordEntity {
  final String? email;

  const ForgotPasswordEntity({this.email});

  @override
  List<Object?> get props => [];

  Map<String, dynamic> toMap() {
    return {'email': email};
  }
}
