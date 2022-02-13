import 'package:artisan/core/entity/default_response.dart';
import 'package:artisan/core/error/failures.dart';
import 'package:artisan/views/board/gig/data/model/list_of_available_gigs_response/list_of_available_gigs_response.dart';
import 'package:artisan/views/board/gig/domain/entity/gig/gig_entity.dart';
import 'package:dartz/dartz.dart';

abstract class GigContract {
  Future<Either<Failure, ListOfAvailableGigsResponse>> listOfGigs(
      GigEntity entity);
  Future<Either<Failure, DefaultResponse>> saveGig(GigEntity entity);
}
