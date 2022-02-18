import 'package:artisan/core/error/failures.dart';
import 'package:artisan/views/review/data/model/reviews_response/reviews_response.dart';
import 'package:artisan/views/review/data/sourceImpl/reviewSourceImpl.dart';
import 'package:artisan/views/review/domain/contract/review_contract.dart';
import 'package:dartz/dartz.dart';
import 'package:artisan/views/review/domain/entity/review_entity.dart';

class ReviewContractImpl implements ReviewContract {
  ReviewSourceImpl _impl;

  ReviewContractImpl(this._impl);

  @override
  Future<Either<Failure, ReviewsResponse>> reviews(ReviewEntity entity) async {
    try {
      final _response = await _impl.reviews(entity: entity);
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }
}
