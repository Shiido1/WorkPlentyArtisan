import 'package:artisan/core/helper/configs/instances.dart';
import 'package:artisan/views/onboarding/domain/entity/profile_entity.dart';
import 'package:artisan/views/onboarding/domain/usecases/profile_usecases.dart';
import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileUseCases _useCase;

  ProfileBloc(this._useCase) : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) async {
      /// Bio event
      if (event is BioProfileUpdate) {
        try {
          emit(ProfileLoading());
          final _response =
              await _useCase.updateProfileBio(Params(entity: event.entity));
          _response!.fold(
              (l) => logger.e(l), (r) => emit(ProfileSuccess(response: r)));
        } catch (e) {
          emit(ProfileFailed(message: e.toString()));
        }
      }

      /// Location event
      if (event is LocationProfileUpdate) {
        try {
          emit(ProfileLoading());
          final _response =
              await _useCase.updateLocationBio(Params(entity: event.entity));
          _response!.fold(
              (l) => emit(ProfileFailed(message: l.errorMessage(l)!)),
              (r) => emit(ProfileSuccess(response: r)));
        } catch (e) {
          emit(ProfileFailed(message: e.toString()));
        }
      }

      /// Avatar event
      if (event is AvatarProfileUpdate) {
        try {
          emit(ProfileLoading());
          final _response =
              await _useCase.updateAvatarBio(Params(entity: event.entity));
          _response!.fold(
              (l) => emit(ProfileFailed(message: l.errorMessage(l)!)),
              (r) => emit(ProfileSuccess(response: r)));
        } catch (e) {
          emit(ProfileFailed(message: e.toString()));
        }
      }

      /// Updates artisans skills
      if (event is SkillsProfileUpdate) {
        try {
          emit(ProfileLoading());
          final _response =
              await _useCase.updateSkills(Params(entity: event.entity));
          _response!.fold(
              (l) => emit(ProfileFailed(message: l.errorMessage(l)!)),
              (r) => emit(ProfileSuccess(response: r)));
        } catch (e) {
          emit(ProfileFailed(message: e.toString()));
        }
      }

      /// Updates artisans experience
      if (event is UpdateExperience) {
        try {
          emit(ProfileLoading());
          final _response = await _useCase
              .updateExperienceLevel(Params(entity: event.entity));
          _response!.fold(
              (l) => emit(ProfileFailed(message: l.errorMessage(l)!)),
              (r) => emit(ProfileSuccess(response: r)));
        } catch (e) {
          emit(ProfileFailed(message: e.toString()));
        }
      }

      /// Remove artisans experience
      if (event is RemoveWorkExperience) {
        try {
          emit(ProfileLoading());
          final _response = await _useCase.removeArtisanWorkHistory(event.id);
          _response!.fold(
              (l) => emit(ProfileFailed(message: l.errorMessage(l)!)),
              (r) => emit(ProfileSuccess(response: r)));
        } catch (e) {
          emit(ProfileFailed(message: e.toString()));
        }
      }

      /// Updates artisans education
      if (event is UpdateEducation) {
        try {
          emit(ProfileLoading());
          final _response =
              await _useCase.updateEducation(Params(entity: event.entity));
          _response!.fold(
              (l) => emit(ProfileFailed(message: l.errorMessage(l)!)),
              (r) => emit(ProfileSuccess(response: r)));
        } catch (e) {
          emit(ProfileFailed(message: e.toString()));
        }
      }

      /// Updates artisans work Experience
      if (event is UpdateWorkExperience) {
        try {
          emit(ProfileLoading());
          final _response =
              await _useCase.updateWorkHistory(Params(entity: event.entity));
          _response!.fold(
              (l) => emit(ProfileFailed(message: l.errorMessage(l)!)),
              (r) => emit(ProfileSuccess(response: r)));
        } catch (e) {
          emit(ProfileFailed(message: e.toString()));
        }
      }

      /// Updates artisans work availability
      if (event is UpdateAvailabilityRate) {
        try {
          emit(ProfileLoading());
          final _response = await _useCase
              .updateWorkAvailability(Params(entity: event.entity));
          _response!.fold(
              (l) => emit(ProfileFailed(message: l.errorMessage(l)!)),
              (r) => emit(ProfileSuccess(response: r)));
        } catch (e) {
          emit(ProfileFailed(message: e.toString()));
        }
      }

      /// Updates artisans preferred language
      if (event is UpdatePreferredLanguage) {
        try {
          emit(ProfileLoading());
          final _response =
              await _useCase.updateLanguage(Params(entity: event.entity));
          _response!.fold(
              (l) => emit(ProfileFailed(message: l.errorMessage(l)!)),
              (r) => emit(ProfileSuccess(response: r)));
        } catch (e) {
          emit(ProfileFailed(message: e.toString()));
        }
      }
    });
  }
}
