import 'package:artisan/core/entity/default_response.dart';
import 'package:artisan/core/error/failures.dart';
import 'package:artisan/core/usecases/usecase.dart';
import 'package:artisan/views/review/data/contractImpl/reviewContractImpl.dart';
import 'package:artisan/views/review/data/model/reviews_response/reviews_response.dart';
import 'package:artisan/views/review/domain/entity/review_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class ReviewUseCases extends UseCase<DefaultResponse, Params> {
  final ReviewContractImpl _repository;

  ReviewUseCases(this._repository);

  @override
  Future<Either<Failure, ReviewsResponse>>? reviews(Params p) async {
    return await _repository.reviews(p.entity!);
  }
}

class Params extends Equatable {
  final ReviewEntity? entity;

  const Params({required this.entity});

  @override
  List<Object> get props => [entity!];
}
