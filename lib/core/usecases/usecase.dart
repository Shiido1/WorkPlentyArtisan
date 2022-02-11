// ignore_for_file: body_might_complete_normally_nullable

import 'package:artisan/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

//? General Application UseCases

class UseCase<Type, Params> {
  Future<Either<Failure, Type>>? call(Params params) {}
  Future<Either<Failure, Type>>? registerUseCase(Params params) {}
  Future<Either<Failure, Type>>? socialAuthentication(Params params) {}
  Future<Either<Failure, Type>>? loginUseCase(Params params) {}
  Future<Either<Failure, Type>>? forgotPasswordUseCase(Params params) {}
  Future<Either<Failure, Type>>? resetPasswordUseCase(Params params) {}
  Future<Either<Failure, Type>>? requestVerificationPinUseCase() {}
  Future<Either<Failure, Type>>? pinVerificationConfirmation(Params params) {}
  Future<Either<Failure, Type>>? updateProfileBio(Params params) {}
  Future<Either<Failure, Type>>? updateLocationBio(Params params) {}
  Future<Either<Failure, Type>>? updateAvatarBio(Params params) {}
  Future<Either<Failure, Type>>? saveGigUseCase(Params params) {}
  Future<Either<Failure, Type>>? getAllCardUseCase() {}
  Future<Either<Failure, Type>>? chatListUseCase() {}

  Future<Either<Failure, Type>>? saveClientsGig(Params params) {}
  Future<Either<Failure, Type>>? removeAttachment(Params params) {}
  Future<Either<Failure, Type>>? savedGigsSave(Params params) {}
  Future<Either<Failure, Type>>? getListOfAvailableGigs(Params params) {}
  Future<Either<Failure, Type>>? getDetailsOfGig(Params params) {}
  Future<Either<Failure, Type>>? categoriesOfGig() {}
  Future<Either<Failure, Type>>? listOfSkills() {}
  Future<Either<Failure, Type>>? listOfArtisan() {}
  Future<Either<Failure, Type>>? savedProfile(Params params) {}
  Future<Either<Failure, Type>>? generalListOfIndustries() {}
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
