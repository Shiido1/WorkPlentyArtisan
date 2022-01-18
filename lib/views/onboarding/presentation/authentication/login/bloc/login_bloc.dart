import 'package:artisan/core/helper/configs/instances.dart';
import 'package:artisan/views/onboarding/domain/entity/login_entity.dart';
import 'package:artisan/views/onboarding/domain/usecases/login_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase _useCase;

  LoginBloc(this._useCase) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (event is LoginingEvent) {
        try {
          emit(LoginLoading());
          final _response = await _useCase(Params(entity: event.entity));
          _response.fold((l) => emit(LoginFailed(message: l.errorMessage(l))),
              (r) => emit(LoginSuccess(response: r)));
        } catch (e) {
          logger.e(e.toString());
          emit(LoginFailed(message: e.toString()));
        }
      }
    });
  }
}
