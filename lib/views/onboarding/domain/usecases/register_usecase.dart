import 'dart:math';

import 'package:artisan/core/error/failures.dart';
import 'package:artisan/core/usecases/usecase.dart';
import 'package:artisan/views/onboarding/data/contractImpl/authorization_impl.dart';
import 'package:artisan/views/onboarding/data/model/register_response/register_response.dart';
import 'package:artisan/views/onboarding/domain/entity/register_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class RegisterUseCase implements UseCase<RegisterEntity, Params> {
  final AuthorizationContractImpl repository;

  RegisterUseCase(this.repository);

  @override
  Future<Either<Failure, RegisterResponse>> call(Params params) async {
    return await repository.register(params.entity!);
  }
}

class Params extends Equatable {
  final RegisterEntity? entity;

  const Params({@required this.entity});

  @override
  List<Object> get props => [entity!];
}
