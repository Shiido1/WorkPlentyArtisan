import 'package:artisan/core/helper/configs/instances.dart';
import 'package:artisan/views/onboarding/domain/entity/forgot_password_entity.dart';
import 'package:artisan/views/onboarding/domain/entity/reset_password_entity.dart';
import 'package:artisan/views/onboarding/domain/usecases/forgot_password_usecase.dart';
import 'package:artisan/views/onboarding/domain/usecases/reset_password_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'password_event.dart';
part 'password_state.dart';

class PasswordBloc extends Bloc<PasswordEvent, PasswordState> {
  final ForgotPasswordUseCase _forgotPasswordUseCase;
  final ResetPasswordUseCase _resetPasswordUseCase;

  PasswordBloc(this._forgotPasswordUseCase, this._resetPasswordUseCase)
      : super(PasswordInitial()) {
    on<PasswordEvent>((event, emit) async {
      if (event is ForgotPasswordEvent) {
        try {
          emit(PasswordLoading());
          final _response = await _forgotPasswordUseCase(
              ForgotPasswordParams(entity: event.entity));
          _response.fold(
              (l) => emit(PasswordFailed(message: l.errorMessage(l))),
              (r) => emit(PasswordSuccess(response: r)));
        } catch (e) {
          logger.e(e.toString());
          emit(PasswordFailed(message: e.toString()));
        }
      }

      if (event is ResetPasswordEvent) {
        try {
          emit(PasswordLoading());
          final _response =
              await _resetPasswordUseCase(Params(entity: event.entity));
          _response.fold(
              (l) => emit(PasswordFailed(message: l.errorMessage(l))),
              (r) => emit(PasswordSuccess(response: r)));
        } catch (e) {
          logger.e(e.toString());
          emit(PasswordFailed(message: e.toString()));
        }
      }
    });
  }
}
