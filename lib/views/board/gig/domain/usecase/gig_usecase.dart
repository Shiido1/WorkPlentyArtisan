import 'package:artisan/core/entity/default_response.dart';
import 'package:artisan/core/error/failures.dart';
import 'package:artisan/core/usecases/usecase.dart';
import 'package:artisan/views/board/gig/data/contractImpl/gigContractImpl.dart';
import 'package:artisan/views/board/gig/data/model/list_of_available_gigs_response/list_of_available_gigs_response.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../entity/gig/gig_entity.dart';

class GigUseCases extends UseCase<DefaultResponse, Params> {
  final GigContractImpl _repository;

  GigUseCases(this._repository);

  @override
  Future<Either<Failure, ListOfAvailableGigsResponse>>? getListOfAvailableGigs(
      Params params) async {
    return await _repository.listOfGigs(params.entity!);
  }

  @override
  Future<Either<Failure, DefaultResponse>>? saveClientsGig(
      Params params) async {
    return await _repository.saveGig(params.entity!);
  }
}

class Params extends Equatable {
  final GigEntity? entity;

  const Params({required this.entity});

  @override
  List<Object?> get props => [entity!];
}
