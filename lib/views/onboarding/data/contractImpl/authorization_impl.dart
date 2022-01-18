import 'package:artisan/core/error/failures.dart';
import 'package:artisan/views/onboarding/data/model/login_response/login_response.dart';
import 'package:artisan/views/onboarding/data/model/register_response/register_response.dart';
import 'package:artisan/views/onboarding/data/sourceImpl/authorization_source_contract_impl.dart';
import 'package:artisan/views/onboarding/domain/contract/authorization_contracts.dart';
import 'package:artisan/views/onboarding/domain/entity/login_entity.dart';
import 'package:artisan/views/onboarding/domain/entity/register_entity.dart';
import 'package:dartz/dartz.dart';

class AuthorizationContractImpl implements AuthorizationContract {
  final AuthorizationSourcesImpl? authorizationSources;

  AuthorizationContractImpl(this.authorizationSources);

  @override
  Future<Either<Failure, RegisterResponse>> register(
      RegisterEntity entity) async {
    try {
      final _response = await authorizationSources!.register(entity);

      /// cache users informations

      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, LoginResponse>> login(LoginEntity entity) async {
    try {
      final _response = await authorizationSources!.login(entity);

      ///Todo: cache users informations

      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }
}
