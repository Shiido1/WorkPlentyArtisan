import 'package:artisan/core/entity/default_response.dart';
import 'package:artisan/views/board/gig/data/model/list_of_available_gigs_response/list_of_available_gigs_response.dart';
import 'package:artisan/core/error/failures.dart';
import 'package:artisan/views/board/gig/data/sourceImpl/gigSourceImpl.dart';
import 'package:artisan/views/board/gig/domain/contract/gig_contract.dart';
import 'package:artisan/views/board/gig/domain/entity/gig/gig_entity.dart';
import 'package:dartz/dartz.dart';

class GigContractImpl implements GigContract {
  final GigSourceImpl _impl;

  GigContractImpl(this._impl);

  @override
  Future<Either<Failure, ListOfAvailableGigsResponse>> listOfGigs(
      GigEntity entity) async {
    try {
      final _response = await _impl.listOfGigs(entity);
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, DefaultResponse>> saveGig(GigEntity entity) async {
    try {
      final _response = await _impl.saveGig(entity);
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ListOfAvailableGigsResponse>> listOfSavedGigs(
      GigEntity entity) async {
    try {
      final _response = await _impl.listOfSavedGigs(entity);
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }
}
