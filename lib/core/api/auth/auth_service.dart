import 'package:artisan/core/helper/configs/instances.dart';
import 'package:artisan/core/network/network_service.dart';
import 'package:artisan/core/network/url_config.dart';
import 'package:artisan/views/onboarding/data/model/register_response/register_response.dart';
import 'package:artisan/views/onboarding/domain/entity/register_entity.dart';

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
}
