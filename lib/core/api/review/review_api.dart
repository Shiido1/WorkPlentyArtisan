import 'package:artisan/core/network/network_service.dart';
import 'package:artisan/core/network/url_config.dart';
import 'package:artisan/views/review/data/model/reviews_response/reviews_response.dart';
import 'package:artisan/views/review/domain/entity/review_entity.dart';

class ReviewApi {
  final NetworkService _networkService;

  ReviewApi({required NetworkService networkService})
      : _networkService = networkService;

  Future<ReviewsResponse> reviews({ReviewEntity? entity}) async {
    try {
      final _response =
          await _networkService.call(UrlConfig.reviewList, RequestMethod.get);
      return ReviewsResponse.fromJson(_response.data);
    } catch (e) {
      rethrow;
    }
  }
}
