import 'package:artisan/core/helper/configs/instances.dart';
import 'package:artisan/views/onboarding/domain/entity/register_entity.dart';
import 'package:artisan/views/onboarding/domain/usecases/register_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUseCase _useCase;

  RegisterBloc(this._useCase) : super(RegisterInitial()) {
    on<RegisterEvent>((event, emit) async {
      if (event is RegisteringEvent) {
        try {
          emit(RegisterLoading());
          final _response = await _useCase(Params(entity: event.entity));
          _response.fold(
              (l) => emit(RegisterFailed(message: l.errorMessage(l))),
              (r) => emit(RegisterSuccess(response: r)));
        } catch (e) {
          logger.e(e.toString());
          emit(RegisterFailed(message: e.toString()));
        }
      }
    });
  }
}
