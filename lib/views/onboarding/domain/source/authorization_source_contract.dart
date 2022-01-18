import 'package:artisan/views/onboarding/data/model/login_response/login_response.dart';
import 'package:artisan/views/onboarding/data/model/register_response/register_response.dart';
import 'package:artisan/views/onboarding/domain/entity/login_entity.dart';
import 'package:artisan/views/onboarding/domain/entity/register_entity.dart';

abstract class AuthorizationSources {
  Future<RegisterResponse> register(RegisterEntity entity);
  Future<LoginResponse> login(LoginEntity entity);
}
