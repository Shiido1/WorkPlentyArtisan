import 'package:artisan/core/entity/default_response.dart';
import 'package:artisan/core/error/failures.dart';
import '../model/gigs_response/gigs_response.dart';
import 'package:artisan/views/board/gig/data/sourceImpl/gigSourceImpl.dart';
import 'package:artisan/views/board/gig/domain/contract/gig_contract.dart';
import 'package:artisan/views/board/gig/domain/entity/gig/gig_entity.dart';
import 'package:dartz/dartz.dart';

import '../model/gigs_response/gigs_response.dart';

class GigContractImpl implements GigContract {
  final GigSourceImpl _impl;

  GigContractImpl(this._impl);

  @override
  Future<Either<Failure, GigsResponse>> listOfGigs(GigEntity entity) async {
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
  Future<Either<Failure, DefaultResponse>> removeGig(GigEntity entity) async {
    try {
      final _response = await _impl.removeGig(entity);
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, GigsResponse>> listOfSavedGigs(
      GigEntity entity) async {
    try {
      final _response = await _impl.listOfSavedGigs(entity);
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, DefaultResponse>> bidGig(GigEntity entity) async {
    try {
      final _response = await _impl.bidGig(entity);
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }
}
