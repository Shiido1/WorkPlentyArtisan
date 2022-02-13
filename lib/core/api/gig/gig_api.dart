import 'package:artisan/core/entity/default_response.dart';
import 'package:artisan/core/helper/configs/instances.dart';
import 'package:artisan/core/network/network_service.dart';
import 'package:artisan/core/network/url_config.dart';
import 'package:artisan/views/board/gig/data/model/list_of_available_gigs_response/list_of_available_gigs_response.dart';
import 'package:artisan/views/board/gig/domain/entity/gig/gig_entity.dart';

class GigApi {
  final NetworkService _networkService;

  GigApi({required NetworkService networkService})
      : _networkService = networkService;

  /// Return a list of available lists
  Future<ListOfAvailableGigsResponse> getListOfAvailableGigs(
      {required GigEntity entity}) async {
    try {
      final _response = await _networkService.call(
          UrlConfig.gigList, RequestMethod.get,
          queryParams: entity.availableListQuery());
      return ListOfAvailableGigsResponse.fromJson(_response.data);
    } catch (e) {
      rethrow;
    }
  }

  /// Save a gig
  Future<DefaultResponse> saveGig({required GigEntity entity}) async {
    try {
      final _response = await _networkService.call(
          UrlConfig.savedGigSave, RequestMethod.post,
          data: entity.savedGigsSave());
      return DefaultResponse.fromJson(_response.data);
    } catch (e) {
      rethrow;
    }
  }
}
