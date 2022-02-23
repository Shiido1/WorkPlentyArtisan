import 'package:artisan/core/api/bid/bid_api.dart';
import 'package:artisan/views/board/presentation/profile/presentation/bids/data/model/list_of_bids_response/list_of_bids_response.dart';
import 'package:artisan/views/board/presentation/profile/presentation/bids/domain/entity/bid/bid_entity.dart';
import 'package:artisan/views/board/presentation/profile/presentation/bids/domain/source/live/bid_source.dart';

class BidSourceImpl implements BidSource {
  final BidApi _api;

  BidSourceImpl({required BidApi api}) : _api = api;

  @override
  Future<ListOfBidsResponse> listOfBids(BidEntity entity) async {
    return await _api.bids(entity: entity);
  }
}
