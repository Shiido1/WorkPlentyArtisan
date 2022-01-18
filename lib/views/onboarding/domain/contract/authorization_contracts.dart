import 'package:artisan/core/error/failures.dart';
import 'package:artisan/views/onboarding/data/model/register_response/register_response.dart';
import 'package:artisan/views/onboarding/domain/entity/register_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthorizationContract {
  Future<Either<Failure, RegisterResponse>> register(RegisterEntity entity);
}
