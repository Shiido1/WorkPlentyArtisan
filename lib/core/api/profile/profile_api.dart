import 'package:artisan/core/entity/default_response.dart';
import 'package:artisan/core/helper/configs/instances.dart';
import 'package:artisan/core/network/network_service.dart';
import 'package:artisan/core/network/url_config.dart';
import 'package:artisan/views/onboarding/data/model/general_list_of_industry_response/general_list_of_industry_response.dart';
import 'package:artisan/views/onboarding/data/model/industry_categories_response/industry_categories_response.dart';
import 'package:artisan/views/onboarding/data/model/skills_response/skills_response.dart';
import 'package:artisan/views/onboarding/domain/entity/auth_entity.dart';
import 'package:artisan/views/onboarding/domain/entity/industry_entity.dart';
import 'package:artisan/views/onboarding/domain/entity/profile_entity.dart';
import 'package:dio/dio.dart';

class ProfileApi {
  final NetworkService _networkService;

  ProfileApi({required NetworkService networkService})
      : _networkService = networkService;

  Future<DefaultResponse> profileBioUpdate(ProfileEntity entity) async {
    try {
      final _response = await _networkService.call(
          UrlConfig.profileBioUpdate, RequestMethod.post,
          data: entity.toMap());
      return DefaultResponse.fromJson(_response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<DefaultResponse> profileLocationUpdate(ProfileEntity entity) async {
    try {
      final _response = await _networkService.call(
          UrlConfig.profileLocationUpdate, RequestMethod.post,
          data: entity.toLocation());
      return DefaultResponse.fromJson(_response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<DefaultResponse> profileAvatarUpdate(ProfileEntity entity) async {
    try {
      final _response = await _networkService.call(
          UrlConfig.profileAvatarUpdate, RequestMethod.upload,
          formData: FormData.fromMap(entity.toAvatar()));
      return DefaultResponse.fromJson(_response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> saveIndustry(IndustryEntity entity) async {
    try {
      await _networkService
          .call(UrlConfig.saveIndustry, RequestMethod.post, data: {});
      return;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> listIndustry() async {
    try {
      await _networkService.call(UrlConfig.listIndustry, RequestMethod.get);
      return;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> deleteIndustry(IndustryEntity entity) async {
    try {
      await _networkService
          .call(UrlConfig.deleteIndustry, RequestMethod.post, data: {});
      return;
    } catch (e) {
      rethrow;
    }
  }

  /// Returns list of general industries
  Future<GeneralListOfIndustryResponse> generalListOfIndustries() async {
    try {
      final _response = await _networkService.call(
          UrlConfig.generalIndustryList, RequestMethod.get);
      return GeneralListOfIndustryResponse.fromJson(_response.data);
    } catch (e) {
      rethrow;
    }
  }

  /// Returns categories of gigs
  Future<IndustryCategoriesResponse> categoryOfGigs() async {
    try {
      final _response =
          await _networkService.call(UrlConfig.gigCategory, RequestMethod.get);
      return IndustryCategoriesResponse.fromJson(_response.data);
    } catch (e) {
      rethrow;
    }
  }

  /// Returns skills
  Future<SkillsResponse> skills() async {
    try {
      final _response =
          await _networkService.call(UrlConfig.skillsFetch, RequestMethod.get);
      return SkillsResponse.fromJson(_response.data);
    } catch (e) {
      rethrow;
    }
  }

  /// Update skills
  Future<DefaultResponse> updateSkills(ProfileEntity entity) async {
    try {
      final _response = await _networkService.call(
          UrlConfig.artisanSkillUpdate, RequestMethod.post,
          data: entity.toSkills());
      return DefaultResponse.fromJson(_response.data);
    } catch (e) {
      rethrow;
    }
  }

  /// Update experience level
  Future<DefaultResponse> updateExperienceLevel(ProfileEntity entity) async {
    try {
      final _response = await _networkService.call(
          UrlConfig.artisanExperienceUpdate, RequestMethod.post,
          data: entity.toExperience());
      return DefaultResponse.fromJson(_response.data);
    } catch (e) {
      rethrow;
    }
  }

  /// Update education level
  Future<DefaultResponse> updateEducation(ProfileEntity entity) async {
    try {
      final _response = await _networkService.call(
          UrlConfig.artisanEducationUpdate, RequestMethod.post,
          data: entity.toEducation());
      return DefaultResponse.fromJson(_response.data);
    } catch (e) {
      rethrow;
    }
  }
}
