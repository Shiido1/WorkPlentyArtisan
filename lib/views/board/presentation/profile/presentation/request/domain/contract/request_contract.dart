import 'package:artisan/core/error/failures.dart';
import 'package:artisan/views/board/presentation/profile/presentation/request/data/model/request_response/request_response.dart';
import 'package:artisan/views/board/presentation/profile/presentation/request/domain/entity/request_entity.dart';
import 'package:dartz/dartz.dart';

abstract class RequestContract {
  Future<Either<Failure, RequestResponse>> requests(RequestEntity entity);
}
