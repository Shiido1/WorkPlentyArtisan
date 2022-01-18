import 'package:artisan/core/api/auth/auth_service.dart';
import 'package:artisan/views/onboarding/data/model/register_response/register_response.dart';
import 'package:artisan/views/onboarding/domain/entity/register_entity.dart';

import '../../domain/source/authorization_source_contract.dart';

class AuthorizationSourcesImpl implements AuthorizationSources {
  final AuthorizationService _authorizationService;

  AuthorizationSourcesImpl({required AuthorizationService authorizationService})
      : _authorizationService = authorizationService;

  @override
  Future<RegisterResponse> register(RegisterEntity entity) async {
    return await _authorizationService.register(entity);
  }
}
