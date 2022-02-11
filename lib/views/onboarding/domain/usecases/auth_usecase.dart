import 'package:artisan/core/error/failures.dart';
import 'package:artisan/core/usecases/usecase.dart';
import 'package:artisan/views/onboarding/data/contractImpl/authContractImpl.dart';
import 'package:artisan/views/onboarding/data/model/auth_response/auth_response.dart';
import 'package:artisan/views/onboarding/domain/entity/auth_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class AuthUsesCases extends UseCase<AuthEntity, Params> {
  final AuthContractImpl _repository;

  AuthUsesCases(this._repository);

  @override
  Future<Either<Failure, AuthResponse>> registerUseCase(Params params) async {
    return await _repository.register(params.entity!);
  }

  @override
  Future<Either<Failure, AuthResponse>> loginUseCase(Params params) async {
    return await _repository.login(params.entity!);
  }

  @override
  Future<Either<Failure, AuthResponse>>? socialAuthentication(
      Params params) async {
    return await _repository.socialAuthentication(params.entity!);
  }

  @override
  Future<Either<Failure, AuthResponse>>? forgotPasswordUseCase(
      Params params) async {
    return await _repository.forgotPassword(params.entity!);
  }

  @override
  Future<Either<Failure, AuthResponse>>? pinVerificationConfirmation(
      Params params) async {
    return await _repository.verificationPinConfirm(params.entity!);
  }

  @override
  Future<Either<Failure, AuthEntity>>? requestVerificationPinUseCase() async {
    return await _repository.verificationPinRequest();
  }

  @override
  Future<Either<Failure, AuthEntity>> call(Params params) {
    throw UnimplementedError();
  }
}

class Params extends Equatable {
  final AuthEntity? entity;

  const Params({required this.entity});

  @override
  List<Object> get props => [entity!];
}
