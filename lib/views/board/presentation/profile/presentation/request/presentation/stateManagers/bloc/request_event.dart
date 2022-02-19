part of 'request_bloc.dart';

abstract class RequestEvent extends Equatable {
  const RequestEvent();

  @override
  List<Object> get props => [];
}

class AcceptOrDeclineEvent extends RequestEvent {
  final RequestEntity? entity;

  AcceptOrDeclineEvent({this.entity});
}
