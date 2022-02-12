import 'package:artisan/core/entity/default_response.dart';
import 'package:artisan/core/error/failures.dart';
import 'package:artisan/core/usecases/usecase.dart';
import 'package:artisan/views/onboarding/data/contractImpl/profileContractImpl.dart';
import 'package:artisan/views/onboarding/data/model/general_list_of_industry_response/general_list_of_industry_response.dart';
import 'package:artisan/views/onboarding/data/model/industry_categories_response/industry_categories_response.dart';
import 'package:artisan/views/onboarding/data/model/skills_response/skills_response.dart';
import 'package:artisan/views/onboarding/domain/entity/profile_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class ProfileUseCases extends UseCase<DefaultResponse, Params> {
  final ProfileContractImpl _repository;

  ProfileUseCases(this._repository);

  @override
  Future<Either<Failure, DefaultResponse>>? updateProfileBio(
      Params params) async {
    return await _repository.profileBioUpdate(params.entity!);
  }

  @override
  Future<Either<Failure, DefaultResponse>>? updateLocationBio(
      Params params) async {
    return await _repository.profileLocationUpdate(params.entity!);
  }

  @override
  Future<Either<Failure, DefaultResponse>>? updateAvatarBio(
      Params params) async {
    return await _repository.profileAvatarUpdate(params.entity!);
  }

  @override
  Future<Either<Failure, GeneralListOfIndustryResponse>>?
      generalListOfIndustries() async {
    return await _repository.generalListOfIndustry();
  }

  @override
  Future<Either<Failure, IndustryCategoriesResponse>>? gigCategory() async {
    return await _repository.gigCategory();
  }

  @override
  Future<Either<Failure, SkillsResponse>>? listOfSkills() async {
    return await _repository.skills();
  }

  @override
  Future<Either<Failure, DefaultResponse>>? updateSkills(Params p) async {
    return await _repository.updateSkills(p.entity!);
  }

  @override
  Future<Either<Failure, DefaultResponse>>? updateExperienceLevel(
      Params p) async {
    return await _repository.updateExperienceLevel(p.entity!);
  }

  @override
  Future<Either<Failure, DefaultResponse>>? updateEducation(Params p) async {
    return await _repository.updateEducation(p.entity!);
  }

  @override
  Future<Either<Failure, DefaultResponse>>? updateWorkHistory(Params p) async {
    return await _repository.updateWorkHistory(p.entity!);
  }
}

class Params extends Equatable {
  final ProfileEntity? entity;

  const Params({required this.entity});

  @override
  List<Object> get props => [entity!];
}
