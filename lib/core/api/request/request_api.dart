import 'package:artisan/core/network/network_service.dart';
import 'package:artisan/core/network/url_config.dart';
import 'package:artisan/views/board/presentation/profile/presentation/request/data/model/request_response/request_response.dart';
import 'package:artisan/views/board/presentation/profile/presentation/request/domain/entity/request_entity.dart';

class RequestApi {
  final NetworkService _networkService;

  RequestApi({required NetworkService networkService})
      : _networkService = networkService;

  Future<RequestResponse> requests({RequestEntity? entity}) async {
    try {
      final _response = await _networkService.call(
          UrlConfig.artisanRequest, RequestMethod.get);
      return RequestResponse.fromJson(_response.data);
    } catch (e) {
      rethrow;
    }
  }
}
