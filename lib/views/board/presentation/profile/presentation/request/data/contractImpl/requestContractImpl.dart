import 'package:artisan/core/error/failures.dart';
import 'package:artisan/views/board/presentation/profile/presentation/request/data/model/request_response/request_response.dart';
import 'package:artisan/views/board/presentation/profile/presentation/request/data/sourceImpl/requestSourceImpl.dart';
import 'package:artisan/views/board/presentation/profile/presentation/request/domain/contract/request_contract.dart';
import 'package:dartz/dartz.dart';

class RequestContractImpl implements RequestContract {
  final RequestSourceImpl _impl;

  RequestContractImpl(this._impl);

  @override
  Future<Either<Failure, RequestResponse>> requests(entity) async {
    try {
      final _response = await _impl.requests(entity);
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }
}
