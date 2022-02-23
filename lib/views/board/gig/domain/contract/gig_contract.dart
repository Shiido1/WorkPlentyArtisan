import 'package:artisan/core/entity/default_response.dart';
import 'package:artisan/core/error/failures.dart';
import 'package:artisan/views/board/gig/domain/entity/gig/gig_entity.dart';
import 'package:dartz/dartz.dart';

import '../../data/model/gigs_response/gigs_response.dart';

abstract class GigContract {
  Future<Either<Failure, GigsResponse>> listOfGigs(GigEntity entity);
  Future<Either<Failure, DefaultResponse>> saveGig(GigEntity entity);
  Future<Either<Failure, DefaultResponse>> removeGig(GigEntity entity);
  Future<Either<Failure, DefaultResponse>> bidGig(GigEntity entity);
  Future<Either<Failure, GigsResponse>> listOfSavedGigs(GigEntity entity);
}
