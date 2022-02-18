import 'package:artisan/core/error/failures.dart';
import 'package:artisan/views/board/gig/data/model/list_of_available_gigs_response/list_of_available_gigs_response.dart';
import 'package:artisan/views/board/presentation/profile/presentation/bids/data/model/list_of_bids_response/list_of_bids_response.dart';
import 'package:artisan/views/board/presentation/profile/presentation/bids/domain/entity/bid/bid_entity.dart';
import 'package:dartz/dartz.dart';

abstract class BidContract {
  Future<Either<Failure, ListOfBidsResponse>> listOfBids(BidEntity entity);
}
