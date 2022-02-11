

import 'package:artisan/core/api/profile/profile_api.dart';
import 'package:artisan/core/entity/default_response.dart';
import 'package:artisan/views/onboarding/domain/entity/profile_entity.dart';
import 'package:artisan/views/onboarding/domain/source/profile_source.dart';

class ProfileSourceImpl implements ProfileSource {
  final ProfileApi _api;

  ProfileSourceImpl({required ProfileApi api}) : _api = api;

  @override
  Future<DefaultResponse> profileAvatarUpdate(ProfileEntity entity) async {
    return await _api.profileAvatarUpdate(entity);
  }

  @override
  Future<DefaultResponse> profileBioUpdate(ProfileEntity entity) async {
    return await _api.profileBioUpdate(entity);
  }

  @override
  Future<DefaultResponse> profileLocationUpdate(ProfileEntity entity) async {
    return await _api.profileLocationUpdate(entity);
  }
}
