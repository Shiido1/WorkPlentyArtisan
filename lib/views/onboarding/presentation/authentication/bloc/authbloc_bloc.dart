import 'package:artisan/views/onboarding/domain/entity/auth_entity.dart';
import 'package:artisan/views/onboarding/domain/usecases/auth_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'authbloc_event.dart';
part 'authbloc_state.dart';

class AuthblocBloc extends Bloc<AuthblocEvent, AuthblocState> {
  final AuthUsesCases _useCase;

  AuthblocBloc(this._useCase) : super(AuthblocInitial()) {
    on<AuthblocEvent>((event, emit) async {
      // / Social Event
      if (event is SocialAuthEvent) {}

      // / Register Event
      if (event is RegisterEvent) {
        try {
          emit(AuthblocLoading());
          final _response =
              await _useCase.registerUseCase(Params(entity: event.entity));
          _response.fold(
              (l) => emit(AuthblocFailed(message: l.errorMessage(l)!)),
              (r) => emit(AuthblocSuccess(response: r)));
        } catch (e) {
          emit(AuthblocFailed(message: e.toString()));
        }
      }

      /// Login Event
      if (event is LoginEvent) {
        try {
          emit(AuthblocLoading());
          final _response =
              await _useCase.loginUseCase(Params(entity: event.entity));
          _response.fold(
              (l) => emit(AuthblocFailed(message: l.errorMessage(l)!)),
              (r) => emit(AuthblocSuccess(response: r)));
        } catch (e) {
          emit(AuthblocFailed(message: e.toString()));
        }
      }

      /// Verify PIN Event
      if (event is VerifyPinEvent) {
        try {
          emit(AuthblocLoading());
          final _response = await _useCase
              .pinVerificationConfirmation(Params(entity: event.entity));
          _response!.fold(
              (l) => emit(AuthblocFailed(message: l.errorMessage(l)!)),
              (r) => emit(AuthblocSuccess(response: r)));
        } catch (e) {
          emit(AuthblocFailed(message: e.toString()));
        }
      }

      /// Resend PIN Event
      if (event is ResendOTPEvent) {
        try {
          emit(AuthblocLoading());
          final _response = await _useCase.requestVerificationPinUseCase();
          _response!.fold(
              (l) => emit(AuthblocFailed(message: l.errorMessage(l)!)),
              (r) => emit(AuthblocOTPResendSuccess(response: r)));
        } catch (e) {
          emit(AuthblocFailed(message: e.toString()));
        }
      }

      /// Forgot password Event
      if (event is ForgotPasswordEvent) {
        try {
          emit(AuthblocLoading());
          final _response = await _useCase
              .forgotPasswordUseCase(Params(entity: event.entity));
          _response!.fold(
              (l) => emit(AuthblocFailed(message: l.errorMessage(l)!)),
              (r) => emit(AuthblocSuccess(response: r)));
        } catch (e) {
          emit(AuthblocFailed(message: e.toString()));
        }
      }

      /// Create new password
      if (event is ResetPasswordEvent) {
        try {
          emit(AuthblocLoading());
          final _response =
              await _useCase.resetPasswordUseCase(Params(entity: event.entity));
          _response!.fold(
              (l) => emit(AuthblocFailed(message: l.errorMessage(l)!)),
              (r) => emit(AuthblocSuccess(response: r)));
        } catch (e) {
          emit(AuthblocFailed(message: e.toString()));
        }
      }
    });
  }
}
