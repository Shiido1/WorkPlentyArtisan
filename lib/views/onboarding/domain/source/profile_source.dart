import 'package:artisan/core/entity/default_response.dart';
import 'package:artisan/views/onboarding/domain/entity/profile_entity.dart';

abstract class ProfileSource {
  Future<DefaultResponse> profileBioUpdate(ProfileEntity entity);
  Future<DefaultResponse> profileLocationUpdate(ProfileEntity entity);
  Future<DefaultResponse> profileAvatarUpdate(ProfileEntity entity);
}
