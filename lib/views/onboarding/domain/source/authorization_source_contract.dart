import 'package:artisan/core/entity/default_response/default_response.dart';
import 'package:artisan/views/onboarding/data/model/login_response/login_response.dart';
import 'package:artisan/views/onboarding/data/model/register_response/register_response.dart';
import 'package:artisan/views/onboarding/domain/entity/forgot_password_entity.dart';
import 'package:artisan/views/onboarding/domain/entity/login_entity.dart';
import 'package:artisan/views/onboarding/domain/entity/register_entity.dart';
import 'package:artisan/views/onboarding/domain/entity/reset_password_entity.dart';

abstract class AuthorizationSources {
  Future<RegisterResponse> register(RegisterEntity entity);
  Future<LoginResponse> login(LoginEntity entity);
  Future<DefaultResponse> fogotPassword(ForgotPasswordEntity entity);
  Future<DefaultResponse> resetPassword(ResetPasswordEntity entity);
}
