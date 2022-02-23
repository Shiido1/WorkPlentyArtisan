import 'package:artisan/core/entity/default_response.dart';
import 'package:artisan/core/error/failures.dart';
import 'package:artisan/core/usecases/usecase.dart';
import 'package:artisan/views/board/presentation/profile/presentation/bids/data/contractImpl/bidContractImpl.dart';
import 'package:artisan/views/board/presentation/profile/presentation/bids/data/model/list_of_bids_response/list_of_bids_response.dart';
import 'package:artisan/views/board/presentation/profile/presentation/bids/domain/entity/bid/bid_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class BidUseCases extends UseCase<DefaultResponse, Params> {
  final BidContractImpl _repository;

  BidUseCases(this._repository);

  @override
  Future<Either<Failure, ListOfBidsResponse>>? listOfBids(Params p) async {
    return await _repository.listOfBids(p.entity!);
  }
}

class Params extends Equatable {
  final BidEntity? entity;

  const Params({required this.entity});

  @override
  List<Object?> get props => [entity!];
}
