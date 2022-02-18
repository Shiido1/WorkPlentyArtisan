import 'package:artisan/core/error/failures.dart';
import 'package:artisan/views/review/data/model/reviews_response/reviews_response.dart';
import 'package:artisan/views/review/domain/entity/review_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ReviewContract {
  Future<Either<Failure, ReviewsResponse>> reviews(ReviewEntity entity);
}
