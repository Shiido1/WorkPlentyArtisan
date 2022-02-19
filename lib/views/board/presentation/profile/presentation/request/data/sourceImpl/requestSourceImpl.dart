import 'package:artisan/core/api/request/request_api.dart';
import 'package:artisan/views/board/presentation/profile/presentation/request/data/model/request_response/request_response.dart';
import 'package:artisan/views/board/presentation/profile/presentation/request/domain/entity/request_entity.dart';
import 'package:artisan/views/board/presentation/profile/presentation/request/domain/source/live/request_source.dart';

class RequestSourceImpl implements RequestSource {
  final RequestApi _api;

  RequestSourceImpl({required RequestApi api}) : _api = api;

  @override
  Future<RequestResponse> requests(RequestEntity entity) async {
    return await _api.requests(entity: entity);
  }
}
