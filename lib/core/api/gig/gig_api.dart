import 'package:artisan/core/entity/default_response.dart';
import 'package:artisan/core/helper/configs/instances.dart';
import 'package:artisan/core/network/network_service.dart';
import 'package:artisan/core/network/url_config.dart';
import 'package:artisan/views/board/gig/domain/entity/gig/gig_entity.dart';
import 'package:dio/dio.dart';

import '../../../views/board/gig/data/model/gigs_response/gigs_response.dart';

class GigApi {
  final NetworkService _networkService;

  GigApi({required NetworkService networkService})
      : _networkService = networkService;

  /// Return a list of available lists
  Future<GigsResponse> getListOfAvailableGigs(
      {required GigEntity entity}) async {
    try {
      final _response = await _networkService.call(
          UrlConfig.gigList, RequestMethod.get,
          queryParams: entity.availableListQuery());
      return GigsResponse.fromJson(_response.data);
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

  /// Remove a gig
  Future<DefaultResponse> removeGig({required GigEntity entity}) async {
    try {
      final _response = await _networkService.call(
          UrlConfig.removeGigSave, RequestMethod.post,
          data: entity.removeGigsSave());
      return DefaultResponse.fromJson(_response.data);
    } catch (e) {
      rethrow;
    }
  }

  /// list of  gig
  Future<GigsResponse> listOfSavedGigs({required GigEntity entity}) async {
    try {
      final _response =
          await _networkService.call(UrlConfig.savedGig, RequestMethod.get);
      return GigsResponse.fromJson(_response.data);
    } catch (e) {
      rethrow;
    }
  }

  /// list of  gig
  Future<DefaultResponse> submitBid({required GigEntity entity}) async {
    logger.d(entity.submitBid());
    try {
      final _response = await _networkService.call(
          UrlConfig.submitBid, RequestMethod.upload,
          formData: FormData.fromMap(entity.submitBid()));
      return DefaultResponse.fromJson(_response.data);
    } catch (e) {
      rethrow;
    }
  }
}
