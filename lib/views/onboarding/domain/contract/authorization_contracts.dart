import 'package:artisan/core/error/failures.dart';
import 'package:artisan/views/onboarding/data/model/login_response/login_response.dart';
import 'package:artisan/views/onboarding/data/model/register_response/register_response.dart';
import 'package:artisan/views/onboarding/domain/entity/login_entity.dart';
import 'package:artisan/views/onboarding/domain/entity/register_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthorizationContract {
  Future<Either<Failure, RegisterResponse>> register(RegisterEntity entity);
  Future<Either<Failure, LoginResponse>> login(LoginEntity entity);
}
