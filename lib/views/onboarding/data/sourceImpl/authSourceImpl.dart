import 'package:artisan/core/api/auth/auth_api.dart';
import 'package:artisan/views/onboarding/data/model/auth_response/auth_response.dart';
import 'package:artisan/views/onboarding/domain/entity/auth_entity.dart';
import 'package:artisan/views/onboarding/domain/source/auth_source.dart';

class AuthSourceImpl implements AuthSource {
  final AuthApi _authApi;

  AuthSourceImpl({required AuthApi api}) : _authApi = api;

  @override
  Future<AuthResponse> forgotPassword(AuthEntity entity) async {
    return await _authApi.forgotPassword(entity);
  }

  @override
  Future<AuthResponse> login(AuthEntity entity) async {
    return await _authApi.login(entity);
  }

  @override
  Future<AuthResponse> register(AuthEntity entity) async {
    return await _authApi.register(entity);
  }

  @override
  Future<AuthResponse> verificationPinConfirm(entity) async {
    return await _authApi.verificationPinConfirm(entity);
  }

  @override
  Future<AuthResponse> verificationPinRequest() async {
    return await _authApi.verificationPinRequest();
  }

  @override
  Future<AuthResponse> socialAuthentication(AuthEntity entity) async {
    return await _authApi.socialAuthentication(entity);
  }
}
