import 'package:artisan/core/entity/default_response.dart';
import 'package:artisan/core/error/failures.dart';
import 'package:artisan/views/onboarding/domain/entity/profile_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileContract {
  Future<Either<Failure, DefaultResponse>> profileBioUpdate(
      ProfileEntity entity);
  Future<Either<Failure, DefaultResponse>> profileLocationUpdate(
      ProfileEntity entity);
  Future<Either<Failure, DefaultResponse>> profileAvatarUpdate(
      ProfileEntity entity);
}
