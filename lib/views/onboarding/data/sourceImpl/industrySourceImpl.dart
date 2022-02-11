import 'package:artisan/core/api/industry/industry_api.dart';
import 'package:artisan/views/onboarding/data/model/industry/delete_industry_response/delete_industry_response.dart';
import 'package:artisan/views/onboarding/data/model/industry/list_industry_response/list_industr_response.dart';
import 'package:artisan/views/onboarding/data/model/industry/save_industry_response/save_industry_response.dart';
import 'package:artisan/views/onboarding/domain/entity/industry_entity.dart';
import 'package:artisan/views/onboarding/domain/source/industry_source.dart';

class IndustrySourceImpl implements IndustrySource {
  final IndustryApi _api;

  IndustrySourceImpl({required IndustryApi api}) : _api = api;

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
}
