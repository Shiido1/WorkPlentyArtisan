part of 'authbloc_bloc.dart';

abstract class AuthblocState extends Equatable {
  const AuthblocState();

  @override
  List<Object> get props => [];
}

class AuthblocInitial extends AuthblocState {}

class AuthblocLoading extends AuthblocState {}

class AuthblocFailed extends AuthblocState {
  final String message;
  AuthblocFailed({required this.message});
}

class AuthblocSuccess extends AuthblocState {
  final dynamic response;
  AuthblocSuccess({required this.response});
}

class AuthblocOTPResendSuccess extends AuthblocState {
  final dynamic response;
  AuthblocOTPResendSuccess({required this.response});
}

class AuthblocSocialSuccess extends AuthblocState {
  final dynamic response;
  AuthblocSocialSuccess({required this.response});
}
