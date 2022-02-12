import 'package:artisan/core/entity/default_response.dart';
import 'package:artisan/core/error/failures.dart';
import 'package:artisan/views/onboarding/data/model/delete_industry_response/delete_industry_response.dart';
import 'package:artisan/views/onboarding/data/model/general_list_of_industry_response/general_list_of_industry_response.dart';
import 'package:artisan/views/onboarding/data/model/industry_categories_response/industry_categories_response.dart';
import 'package:artisan/views/onboarding/data/model/list_industry_response/list_industr_response.dart';
import 'package:artisan/views/onboarding/data/model/save_industry_response/save_industry_response.dart';
import 'package:artisan/views/onboarding/data/model/skills_response/skills_response.dart';
import 'package:artisan/views/onboarding/domain/entity/industry_entity.dart';
import 'package:artisan/views/onboarding/domain/entity/profile_entity.dart';
import 'package:artisan/views/onboarding/domain/usecases/auth_usecase.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileContract {
  Future<Either<Failure, DefaultResponse>> profileBioUpdate(
      ProfileEntity entity);
  Future<Either<Failure, DefaultResponse>> profileLocationUpdate(
      ProfileEntity entity);
  Future<Either<Failure, DefaultResponse>> profileAvatarUpdate(
      ProfileEntity entity);

  Future<Either<Failure, SaveIndustryResponse>> saveIndustry(
      IndustryEntity entity);
  Future<Either<Failure, ListIndustryResponse>> listIndustry();
  Future<Either<Failure, DeleteIndustryResponse>> deleteIndustry(
      IndustryEntity entity);
  Future<Either<Failure, GeneralListOfIndustryResponse>>
      generalListOfIndustry();
  Future<Either<Failure, IndustryCategoriesResponse>> gigCategory();
  Future<Either<Failure, SkillsResponse>> skills();
  Future<Either<Failure, DefaultResponse>> updateSkills(ProfileEntity entity);
  Future<Either<Failure, DefaultResponse>> updateExperienceLevel(
      ProfileEntity entity);
  Future<Either<Failure, DefaultResponse>> updateEducation(
      ProfileEntity entity);
}
