import 'package:artisan/core/error/failures.dart';
import 'package:artisan/views/onboarding/data/model/industry/delete_industry_response/delete_industry_response.dart';
import 'package:artisan/views/onboarding/data/model/industry/general_list_of_industry_response/general_list_of_industry_response.dart';
import 'package:artisan/views/onboarding/data/model/industry/list_industry_response/list_industr_response.dart';
import 'package:artisan/views/onboarding/data/model/industry/save_industry_response/save_industry_response.dart';
import 'package:artisan/views/onboarding/domain/entity/industry_entity.dart';
import 'package:dartz/dartz.dart';

abstract class IndustryContract {
  Future<Either<Failure, SaveIndustryResponse>> saveIndustry(
      IndustryEntity entity);
  Future<Either<Failure, ListIndustryResponse>> listIndustry();
  Future<Either<Failure, DeleteIndustryResponse>> deleteIndustry(IndustryEntity entity);
  Future<Either<Failure, GeneralListOfIndustryResponse>> generalListOfIndustry();
}
