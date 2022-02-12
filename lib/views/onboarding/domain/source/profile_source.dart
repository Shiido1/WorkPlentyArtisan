import 'package:artisan/core/entity/default_response.dart';
import 'package:artisan/views/onboarding/data/model/config_response/config_response.dart';
import 'package:artisan/views/onboarding/data/model/delete_industry_response/delete_industry_response.dart';
import 'package:artisan/views/onboarding/data/model/general_list_of_industry_response/general_list_of_industry_response.dart';
import 'package:artisan/views/onboarding/data/model/industry_categories_response/industry_categories_response.dart';
import 'package:artisan/views/onboarding/data/model/list_industry_response/list_industr_response.dart';
import 'package:artisan/views/onboarding/data/model/save_industry_response/save_industry_response.dart';
import 'package:artisan/views/onboarding/data/model/skills_response/skills_response.dart';
import 'package:artisan/views/onboarding/data/model/work_history_response/work_history_response.dart';
import 'package:artisan/views/onboarding/domain/entity/industry_entity.dart';
import 'package:artisan/views/onboarding/domain/entity/profile_entity.dart';

abstract class ProfileSource {
  Future<DefaultResponse> profileBioUpdate(ProfileEntity entity);
  Future<DefaultResponse> profileLocationUpdate(ProfileEntity entity);
  Future<DefaultResponse> profileAvatarUpdate(ProfileEntity entity);
  Future<SaveIndustryResponse> saveIndustry(IndustryEntity entity);
  Future<ListIndustryResponse> listIndustry();
  Future<DeleteIndustryResponse> deleteIndustry(IndustryEntity entity);
  Future<GeneralListOfIndustryResponse> generalListOfIndustry();
  Future<IndustryCategoriesResponse> gigCategory();
  Future<SkillsResponse> skills();
  Future<DefaultResponse> updateSkills(ProfileEntity entity);
  Future<DefaultResponse> updateExperienceLevel(ProfileEntity entity);
  Future<DefaultResponse> updateEducation(ProfileEntity entity);
  Future<DefaultResponse> updateWorkHistory(ProfileEntity entity);
  Future<DefaultResponse> updateWorkAvailability(ProfileEntity entity);
  Future<WorkHistoryResponse> workHistory();
  Future<ConfigResponse> configs();
}
