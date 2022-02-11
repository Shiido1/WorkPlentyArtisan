import 'package:artisan/core/entity/default_response.dart';
import 'package:artisan/core/error/failures.dart';
import 'package:artisan/core/usecases/usecase.dart';
import 'package:artisan/views/onboarding/data/contractImpl/profileContractImpl.dart';
import 'package:artisan/views/onboarding/domain/entity/profile_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class ProfileUseCases extends UseCase<DefaultResponse, Params> {
  final ProfileContractImpl _repository;

  ProfileUseCases(this._repository);

  @override
  Future<Either<Failure, DefaultResponse>>? updateProfileBio(
      Params params) async {
    return await _repository.profileBioUpdate(params.entity!);
  }

  @override
  Future<Either<Failure, DefaultResponse>>? updateLocationBio(
      Params params) async {
    return await _repository.profileLocationUpdate(params.entity!);
  }

  @override
  Future<Either<Failure, DefaultResponse>>? updateAvatarBio(
      Params params) async {
    return await _repository.profileAvatarUpdate(params.entity!);
  }
}

class Params extends Equatable {
  final ProfileEntity? entity;

  const Params({required this.entity});

  @override
  List<Object> get props => [entity!];
}
