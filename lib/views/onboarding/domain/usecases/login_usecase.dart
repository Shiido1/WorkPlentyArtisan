import 'package:artisan/core/error/failures.dart';
import 'package:artisan/core/usecases/usecase.dart';
import 'package:artisan/views/onboarding/data/contractImpl/authorization_impl.dart';
import 'package:artisan/views/onboarding/data/model/login_response/login_response.dart';
import 'package:artisan/views/onboarding/domain/entity/login_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class LoginUseCase implements UseCase<LoginEntity, Params> {
  final AuthorizationContractImpl repository;

  LoginUseCase(this.repository);

  @override
  Future<Either<Failure, LoginResponse>> call(Params params) async {
    return await repository.login(params.entity!);
  }
}

class Params extends Equatable {
  final LoginEntity? entity;

  const Params({@required this.entity});

  @override
  List<Object> get props => [entity!];
}
