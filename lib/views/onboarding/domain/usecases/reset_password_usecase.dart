import 'package:artisan/core/entity/default_response/default_response.dart';
import 'package:artisan/core/error/failures.dart';
import 'package:artisan/core/usecases/usecase.dart';
import 'package:artisan/views/onboarding/data/contractImpl/authorization_impl.dart';
import 'package:artisan/views/onboarding/domain/entity/reset_password_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class ResetPasswordUseCase implements UseCase<ResetPasswordEntity, Params> {
  final AuthorizationContractImpl repository;

  ResetPasswordUseCase(this.repository);

  @override
  Future<Either<Failure, DefaultResponse>> call(Params params) async {
    return await repository.resetPassword(params.entity!);
  }
}

class Params extends Equatable {
  final ResetPasswordEntity? entity;

  const Params({@required this.entity});

  @override
  List<Object> get props => [entity!];
}
