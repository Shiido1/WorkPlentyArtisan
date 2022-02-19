import 'package:artisan/core/entity/default_response.dart';
import 'package:artisan/views/board/presentation/profile/presentation/request/data/model/request_response/request_response.dart';
import 'package:artisan/views/board/presentation/profile/presentation/request/domain/entity/request_entity.dart';

abstract class RequestSource {
  Future<RequestResponse> requests(RequestEntity entity);
  Future<DefaultResponse> requestsReply(RequestEntity entity);
}
