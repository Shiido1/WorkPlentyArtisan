import 'package:artisan/core/error/failures.dart';
import 'package:artisan/views/board/gig/data/model/list_of_available_gigs_response/list_of_available_gigs_response.dart';
import 'package:artisan/views/board/presentation/profile/presentation/bids/data/model/list_of_bids_response/list_of_bids_response.dart';
import 'package:artisan/views/board/presentation/profile/presentation/bids/data/sourceImpl/bidSourceImpl.dart';
import 'package:artisan/views/board/presentation/profile/presentation/bids/domain/contract/bid_contract.dart';
import 'package:dartz/dartz.dart';

class BidContractImpl implements BidContract {
  final BidSourceImpl _impl;

  BidContractImpl(this._impl);

  @override
  Future<Either<Failure, ListOfBidsResponse>> listOfBids(entity) async {
    try {
      final _response = await _impl.listOfBids(entity);
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }
}
