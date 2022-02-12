import 'package:artisan/core/entity/default_response.dart';
import 'package:artisan/core/error/failures.dart';
import 'package:artisan/views/onboarding/data/model/delete_industry_response/delete_industry_response.dart';
import 'package:artisan/views/onboarding/data/model/general_list_of_industry_response/general_list_of_industry_response.dart';
import 'package:artisan/views/onboarding/data/model/industry_categories_response/industry_categories_response.dart';
import 'package:artisan/views/onboarding/data/model/list_industry_response/list_industr_response.dart';
import 'package:artisan/views/onboarding/data/model/save_industry_response/save_industry_response.dart';
import 'package:artisan/views/onboarding/data/model/skills_response/skills_response.dart';
import 'package:artisan/views/onboarding/data/sourceImpl/profileSourceImpl.dart';
import 'package:artisan/views/onboarding/domain/contract/profile_contract.dart';
import 'package:artisan/views/onboarding/domain/entity/profile_entity.dart';
import 'package:dartz/dartz.dart';

class ProfileContractImpl implements ProfileContract {
  final ProfileSourceImpl _impl;

  ProfileContractImpl(this._impl);

  @override
  Future<Either<Failure, DefaultResponse>> profileAvatarUpdate(entity) async {
    try {
      final _response = await _impl.profileAvatarUpdate(entity);
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, DefaultResponse>> profileBioUpdate(entity) async {
    try {
      final _response = await _impl.profileBioUpdate(entity);
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, DefaultResponse>> profileLocationUpdate(entity) async {
    try {
      final _response = await _impl.profileLocationUpdate(entity);
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, DeleteIndustryResponse>> deleteIndustry(entity) async {
    try {
      final _response = await _impl.deleteIndustry(entity);
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ListIndustryResponse>> listIndustry() async {
    try {
      final _response = await _impl.listIndustry();
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, SaveIndustryResponse>> saveIndustry(entity) async {
    try {
      final _response = await _impl.saveIndustry(entity);
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, GeneralListOfIndustryResponse>>
      generalListOfIndustry() async {
    try {
      final _response = await _impl.generalListOfIndustry();
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, IndustryCategoriesResponse>> gigCategory() async {
    try {
      final _response = await _impl.gigCategory();
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, SkillsResponse>> skills() async {
    try {
      final _response = await _impl.skills();
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, DefaultResponse>> updateSkills(
      ProfileEntity entity) async {
    try {
      final _response = await _impl.updateSkills(entity);
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, DefaultResponse>> updateExperienceLevel(
      ProfileEntity entity) async {
    try {
      final _response = await _impl.updateExperienceLevel(entity);
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }
}
