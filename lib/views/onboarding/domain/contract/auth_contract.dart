import 'package:artisan/core/error/failures.dart';
import 'package:artisan/views/onboarding/data/model/auth_response/auth_response.dart';
import 'package:artisan/views/onboarding/domain/entity/auth_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthContract {
  Future<Either<Failure, AuthResponse>> socialAuthentication(AuthEntity entity);
  Future<Either<Failure, AuthResponse>> login(AuthEntity entity);
  Future<Either<Failure, AuthResponse>> register(AuthEntity entity);
  Future<Either<Failure, AuthResponse>> forgotPassword(AuthEntity entity);
  Future<Either<Failure, AuthResponse>> verificationPinRequest();
  Future<Either<Failure, AuthResponse>> verificationPinConfirm(
      AuthEntity entity);
  Future<Either<Failure, AuthResponse>> resetPassword(AuthEntity entity);
}
