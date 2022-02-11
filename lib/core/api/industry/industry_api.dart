import 'package:artisan/core/network/network_service.dart';
import 'package:artisan/core/network/url_config.dart';
import 'package:artisan/views/onboarding/domain/entity/industry_entity.dart';

class IndustryApi {
  final NetworkService _networkService;

  IndustryApi({required NetworkService networkService})
      : _networkService = networkService;

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
}
