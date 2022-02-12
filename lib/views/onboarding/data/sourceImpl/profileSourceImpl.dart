import 'package:artisan/core/api/profile/profile_api.dart';
import 'package:artisan/core/entity/default_response.dart';
import 'package:artisan/views/onboarding/data/model/delete_industry_response/delete_industry_response.dart';
import 'package:artisan/views/onboarding/data/model/general_list_of_industry_response/general_list_of_industry_response.dart';
import 'package:artisan/views/onboarding/data/model/industry_categories_response/industry_categories_response.dart';
import 'package:artisan/views/onboarding/data/model/list_industry_response/list_industr_response.dart';
import 'package:artisan/views/onboarding/data/model/save_industry_response/save_industry_response.dart';
import 'package:artisan/views/onboarding/data/model/skills_response/skills_response.dart';
import 'package:artisan/views/onboarding/domain/entity/industry_entity.dart';
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

  @override
  Future<DeleteIndustryResponse> deleteIndustry(IndustryEntity entity) async {
    return await _api.deleteIndustry(entity);
  }

  @override
  Future<ListIndustryResponse> listIndustry() async {
    return await _api.listIndustry();
  }

  @override
  Future<SaveIndustryResponse> saveIndustry(IndustryEntity entity) async {
    return await _api.saveIndustry(entity);
  }

  @override
  Future<IndustryCategoriesResponse> gigCategory() async {
    return await _api.categoryOfGigs();
  }

  @override
  Future<GeneralListOfIndustryResponse> generalListOfIndustry() async {
    return await _api.generalListOfIndustries();
  }

  @override
  Future<SkillsResponse> skills() async {
    return await _api.skills();
  }

  @override
  Future<DefaultResponse> updateSkills(ProfileEntity entity) async {
    return await _api.updateSkills(entity);
  }

  @override
  Future<DefaultResponse> updateExperienceLevel(ProfileEntity entity) async {
    return await _api.updateExperience(entity);
  }
}
