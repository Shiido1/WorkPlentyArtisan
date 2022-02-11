import 'package:artisan/core/error/failures.dart';
import 'package:artisan/core/helper/configs/instances.dart';
import 'package:artisan/views/onboarding/data/model/industry/delete_industry_response/delete_industry_response.dart';
import 'package:artisan/views/onboarding/data/model/industry/general_list_of_industry_response/general_list_of_industry_response.dart';
import 'package:artisan/views/onboarding/data/model/industry/list_industry_response/list_industr_response.dart';
import 'package:artisan/views/onboarding/data/model/industry/save_industry_response/save_industry_response.dart';
import 'package:artisan/views/onboarding/data/sourceImpl/industrySourceImpl.dart';
import 'package:artisan/views/onboarding/domain/contract/industry_contract.dart';
import 'package:dartz/dartz.dart';

class IndustryContractImpl implements IndustryContract {
  final IndustrySourceImpl _impl;

  IndustryContractImpl(this._impl);

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
}
