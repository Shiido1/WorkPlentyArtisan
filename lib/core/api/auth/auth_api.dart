import 'package:artisan/core/helper/configs/instances.dart';
import 'package:artisan/core/network/network_service.dart';
import 'package:artisan/core/network/url_config.dart';
import 'package:artisan/views/onboarding/data/model/auth_response/auth_response.dart';
import 'package:artisan/views/onboarding/domain/entity/auth_entity.dart';
import 'package:google_sign_in/google_sign_in.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

class AuthApi {
  final NetworkService _networkService;

  AuthApi({required NetworkService networkService})
      : _networkService = networkService;

  Future<AuthResponse> login(AuthEntity entity) async {
    try {
      final _response = await _networkService
          .call(UrlConfig.login, RequestMethod.post, data: entity.toLogin());
      return AuthResponse.fromJson(_response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<AuthResponse> socialAuthentication(AuthEntity entity) async {
    try {
      final _response = await _googleSignIn.signIn();
      logger.d(_response?.email);
      return AuthResponse();
    } catch (e) {
      rethrow;
    }
  }

  Future<AuthResponse> register(AuthEntity entity) async {
    try {
      final _response = await _networkService.call(
          UrlConfig.register, RequestMethod.post,
          data: entity.toRegister());
      return AuthResponse.fromJson(_response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<AuthResponse> forgotPassword(AuthEntity entity) async {
    try {
      final _response = await _networkService.call(
          UrlConfig.forgotPassword, RequestMethod.post,
          data: entity.forgotPassword());
      return AuthResponse.fromJson(_response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<AuthResponse> resetPassword(AuthEntity entity) async {
    try {
      final _response = await _networkService.call(
          UrlConfig.resetPassword, RequestMethod.post,
          data: entity.resetNewPassword());
      return AuthResponse.fromJson(_response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<AuthResponse> verificationPinRequest() async {
    try {
      final _response = await _networkService.call(
          UrlConfig.verificationPinRequest, RequestMethod.get);
      return AuthResponse.fromJson(_response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<AuthResponse> verificationPinConfirm(AuthEntity entity) async {
    try {
      final _response = await _networkService.call(
          UrlConfig.verificationPinConfirm, RequestMethod.post,
          data: entity.verifyPIN());
      return AuthResponse.fromJson(_response.data);
    } catch (e) {
      rethrow;
    }
  }
}
