import 'package:artisan/views/onboarding/data/model/auth_response/auth_response.dart';
import 'package:artisan/views/onboarding/domain/entity/auth_entity.dart';

abstract class AuthSource {
  Future<AuthResponse> socialAuthentication(AuthEntity entity);
  Future<AuthResponse> login(AuthEntity entity);
  Future<AuthResponse> register(AuthEntity entity);
  Future<AuthResponse> forgotPassword(AuthEntity entity);
  Future<AuthResponse> verificationPinRequest();
  Future<AuthResponse> verificationPinConfirm(AuthEntity entity);
  Future<AuthResponse> resetPassword(AuthEntity entity);
}
