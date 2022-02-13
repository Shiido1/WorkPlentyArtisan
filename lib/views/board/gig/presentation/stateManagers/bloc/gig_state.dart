// ignore_for_file: must_be_immutable

part of 'gig_bloc.dart';

abstract class GigState extends Equatable {
  const GigState();

  @override
  List<Object> get props => [];
}

class GigInitial extends GigState {}

class GigLoading extends GigState {}

class GigSuccess extends GigState {
  dynamic response;
  GigSuccess(this.response);
}

class GigFailed extends GigState {
  final String errorMessage;
  GigFailed(this.errorMessage);
}
