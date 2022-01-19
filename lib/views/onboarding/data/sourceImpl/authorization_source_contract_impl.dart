import 'package:artisan/core/api/auth/auth_service.dart';
import 'package:artisan/core/entity/default_response/default_response.dart';
import 'package:artisan/views/onboarding/data/model/login_response/login_response.dart';
import 'package:artisan/views/onboarding/data/model/register_response/register_response.dart';
import 'package:artisan/views/onboarding/domain/entity/forgot_password_entity.dart';
import 'package:artisan/views/onboarding/domain/entity/login_entity.dart';
import 'package:artisan/views/onboarding/domain/entity/register_entity.dart';
import 'package:artisan/views/onboarding/domain/entity/reset_password_entity.dart';

import '../../domain/source/authorization_source_contract.dart';

class AuthorizationSourcesImpl implements AuthorizationSources {
  final AuthorizationService _authorizationService;

  AuthorizationSourcesImpl({required AuthorizationService authorizationService})
      : _authorizationService = authorizationService;

  @override
  Future<RegisterResponse> register(RegisterEntity entity) async {
    return await _authorizationService.register(entity);
  }

  @override
  Future<LoginResponse> login(LoginEntity entity) async {
    return await _authorizationService.login(entity);
  }

  @override
  Future<DefaultResponse> fogotPassword(ForgotPasswordEntity entity) async {
    return await _authorizationService.forgotPassword(entity);
  }

  @override
  Future<DefaultResponse> resetPassword(ResetPasswordEntity entity) async {
    return await _authorizationService.resetPassword(entity);
  }
}
