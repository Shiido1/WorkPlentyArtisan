import 'package:artisan/core/network/network_service.dart';
import 'package:artisan/core/network/url_config.dart';
import 'package:artisan/views/board/presentation/profile/presentation/bids/data/model/list_of_bids_response/list_of_bids_response.dart';
import 'package:artisan/views/board/presentation/profile/presentation/bids/domain/entity/bid/bid_entity.dart';

class BidApi {
  final NetworkService _networkService;

  BidApi({required NetworkService networkService})
      : _networkService = networkService;

  Future<ListOfBidsResponse> bids({BidEntity? entity}) async {
    try {
      final _response =
          await _networkService.call(UrlConfig.listOfBids, RequestMethod.get);
      return ListOfBidsResponse.fromJson(_response.data);
    } catch (e) {
      rethrow;
    }
  }
}
