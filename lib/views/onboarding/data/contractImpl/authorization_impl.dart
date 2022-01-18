import 'package:artisan/core/error/failures.dart';
import 'package:artisan/views/onboarding/data/model/register_response/register_response.dart';
import 'package:artisan/views/onboarding/data/sourceImpl/authorization_source_contract_impl.dart';
import 'package:artisan/views/onboarding/domain/contract/authorization_contracts.dart';
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
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }
}
