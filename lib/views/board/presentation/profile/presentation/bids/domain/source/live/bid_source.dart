import 'package:artisan/views/board/gig/data/model/list_of_available_gigs_response/list_of_available_gigs_response.dart';
import 'package:artisan/views/board/presentation/profile/presentation/bids/data/model/list_of_bids_response/list_of_bids_response.dart';
import 'package:artisan/views/board/presentation/profile/presentation/bids/domain/entity/bid/bid_entity.dart';

abstract class BidSource {
  Future<ListOfBidsResponse> listOfBids(BidEntity entity);
}
