part of 'request_bloc.dart';

abstract class RequestState extends Equatable {
  const RequestState();

  @override
  List<Object> get props => [];
}

class RequestInitial extends RequestState {}

class RequestLoading extends RequestState {}

class RequestSuccess extends RequestState {
  final response;
  RequestSuccess({required this.response});
}

class RequestFailed extends RequestState {
  final String? message;
  RequestFailed({required this.message});
}
