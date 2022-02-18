import 'package:artisan/core/api/review/review_api.dart';
import 'package:artisan/views/review/data/model/reviews_response/reviews_response.dart';
import 'package:artisan/views/review/domain/entity/review_entity.dart';
import 'package:artisan/views/review/domain/source/remote/review_source.dart';

class ReviewSourceImpl implements ReviewSource {
  final ReviewApi _api;

  ReviewSourceImpl({required ReviewApi api}) : _api = api;

  @override
  Future<ReviewsResponse> reviews({ReviewEntity? entity}) async {
    return await _api.reviews(entity: entity);
  }
}
