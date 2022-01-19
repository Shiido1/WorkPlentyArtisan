import 'package:artisan/core/entity/default_response/default_response.dart';
import 'package:artisan/core/helper/configs/instances.dart';
import 'package:artisan/core/network/network_service.dart';
import 'package:artisan/core/network/url_config.dart';
import 'package:artisan/views/onboarding/data/model/login_response/login_response.dart';
import 'package:artisan/views/onboarding/data/model/register_response/register_response.dart';
import 'package:artisan/views/onboarding/domain/entity/forgot_password_entity.dart';
import 'package:artisan/views/onboarding/domain/entity/login_entity.dart';
import 'package:artisan/views/onboarding/domain/entity/register_entity.dart';
import 'package:artisan/views/onboarding/domain/entity/reset_password_entity.dart';
import 'package:dio/dio.dart';

class AuthorizationService {
  final NetworkService _networkService;

  AuthorizationService({required NetworkService networkService})
      : _networkService = networkService;

  Future<RegisterResponse> register(RegisterEntity entity) async {
    try {
      final _response = await _networkService.call(
          UrlConfig.register, RequestMethod.post,
          queryParams: entity.toMap());
      return RegisterResponse.fromJson(_response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<LoginResponse> login(LoginEntity entity) async {
    try {
      final _response = await _networkService.call(
          UrlConfig.login, RequestMethod.post,
          queryParams: entity.toMap());
      return LoginResponse.fromJson(_response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<DefaultResponse> forgotPassword(ForgotPasswordEntity entity) async {
    try {
      final _response = await _networkService.call(
          UrlConfig.forgotPassword, RequestMethod.post,
          queryParams: entity.toMap());
      return DefaultResponse.fromJson(_response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<DefaultResponse> resetPassword(ResetPasswordEntity entity) async {
    try {
      final _response = await _networkService.call(
          UrlConfig.resetPassword, RequestMethod.post,
          queryParams: entity.toMap());
      return DefaultResponse.fromJson(_response.data);
    } catch (e) {
      rethrow;
    }
  }
}
