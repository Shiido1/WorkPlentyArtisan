import 'package:artisan/core/entity/default_response/default_response.dart';
import 'package:artisan/core/error/failures.dart';
import 'package:artisan/core/usecases/usecase.dart';
import 'package:artisan/views/onboarding/data/contractImpl/authorization_impl.dart';
import 'package:artisan/views/onboarding/data/model/login_response/login_response.dart';
import 'package:artisan/views/onboarding/domain/entity/forgot_password_entity.dart';
import 'package:artisan/views/onboarding/domain/entity/login_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class ForgotPasswordUseCase
    implements UseCase<ForgotPasswordEntity, ForgotPasswordParams> {
  final AuthorizationContractImpl repository;

  ForgotPasswordUseCase(this.repository);

  @override
  Future<Either<Failure, DefaultResponse>> call(
      ForgotPasswordParams params) async {
    return await repository.forgotPassword(params.entity!);
  }
}

class ForgotPasswordParams extends Equatable {
  final ForgotPasswordEntity? entity;

  const ForgotPasswordParams({@required this.entity});

  @override
  List<Object> get props => [entity!];
}
