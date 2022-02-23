// ignore_for_file: unused_local_variable

import 'package:artisan/views/board/gig/domain/entity/gig/gig_entity.dart';
import 'package:artisan/views/board/gig/domain/usecase/gig_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'gig_event.dart';
part 'gig_state.dart';

class GigBloc extends Bloc<GigEvent, GigState> {
  final GigUseCases _useCase;

  GigBloc(this._useCase) : super(GigInitial()) {
    on<GigEvent>((event, emit) async {
      /// SAVE GIGS
      if (event is SaveGigEvent) {
        try {
          emit(GigLoading());
          final _response =
              await _useCase.saveClientsGig(Params(entity: event.entity));
          _response!.fold((l) => emit(GigFailed(l.errorMessage(l)!)),
              (r) => emit(GigSuccess(r)));
        } catch (e) {}
      }

      /// REMOVE GIGS
      if (event is RemoveGigEvent) {
        try {
          emit(GigLoading());
          final _response =
              await _useCase.removeClientsGig(Params(entity: event.entity));
          _response!.fold((l) => emit(GigFailed(l.errorMessage(l)!)),
              (r) => emit(GigSuccess(r)));
        } catch (e) {}
      }

      /// BID GIGS
      if (event is BidGigEvent) {
        try {
          emit(GigLoading());
          final _response = await _useCase.bidGig(Params(entity: event.entity));
          _response!.fold((l) => emit(GigFailed(l.errorMessage(l)!)),
              (r) => emit(GigSubmitSuccess(r)));
        } catch (e) {}
      }
    });
  }
}
