import 'package:artisan/views/onboarding/data/model/industry/delete_industry_response/delete_industry_response.dart';
import 'package:artisan/views/onboarding/data/model/industry/list_industry_response/list_industr_response.dart';
import 'package:artisan/views/onboarding/data/model/industry/save_industry_response/save_industry_response.dart';
import 'package:artisan/views/onboarding/domain/entity/industry_entity.dart';

abstract class IndustrySource {
  Future<SaveIndustryResponse> saveIndustry(IndustryEntity entity);
  Future<ListIndustryResponse> listIndustry();
  Future<DeleteIndustryResponse> deleteIndustry(IndustryEntity entity);
}
