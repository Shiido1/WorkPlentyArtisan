

import 'package:artisan/views/onboarding/data/model/register_response/register_response.dart';
import 'package:artisan/views/onboarding/domain/entity/register_entity.dart';

abstract class AuthorizationSources {
  Future<RegisterResponse> register(RegisterEntity entity);
}
