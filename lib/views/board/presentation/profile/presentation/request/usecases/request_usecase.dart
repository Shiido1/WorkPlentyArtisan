import 'package:artisan/core/entity/default_response.dart';
import 'package:artisan/core/error/failures.dart';
import 'package:artisan/core/usecases/usecase.dart';
import 'package:artisan/views/board/presentation/profile/presentation/request/data/contractImpl/requestContractImpl.dart';
import 'package:artisan/views/board/presentation/profile/presentation/request/data/model/request_response/request_response.dart';
import 'package:artisan/views/board/presentation/profile/presentation/request/domain/entity/request_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class RequestUseCase extends UseCase<DefaultResponse, Params> {
  final RequestContractImpl _repository;

  RequestUseCase(this._repository);

  @override
  Future<Either<Failure, RequestResponse>>? requests(Params p) async {
    return await _repository.requests(p.entity!);
  }
}

class Params extends Equatable {
  final RequestEntity? entity;

  const Params({required this.entity});

  @override
  List<Object> get props => [entity!];
}
