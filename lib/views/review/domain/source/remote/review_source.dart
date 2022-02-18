import 'package:artisan/views/review/data/model/reviews_response/reviews_response.dart';
import 'package:artisan/views/review/domain/entity/review_entity.dart';

abstract class ReviewSource {
  Future<ReviewsResponse> reviews({ReviewEntity? entity});
}
