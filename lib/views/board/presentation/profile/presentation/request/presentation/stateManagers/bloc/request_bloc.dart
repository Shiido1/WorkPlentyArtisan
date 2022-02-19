import 'package:artisan/views/board/presentation/profile/presentation/request/domain/entity/request_entity.dart';
import 'package:artisan/views/board/presentation/profile/presentation/request/usecases/request_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'request_event.dart';
part 'request_state.dart';

class RequestBloc extends Bloc<RequestEvent, RequestState> {
  final RequestUseCase _useCase;

  RequestBloc(this._useCase) : super(RequestInitial()) {
    on<RequestEvent>((event, emit) async {
      if (event is AcceptOrDeclineEvent) {
        try {
          emit(RequestLoading());
          final _response =
              await _useCase.requestsReply(Params(entity: event.entity));
          _response!.fold(
              (l) => emit(RequestFailed(message: l.errorMessage(l))),
              (r) => emit(RequestSuccess(response: r)));
        } catch (e) {}
      }
    });
  }
}
