// ignore_for_file: must_be_immutable

part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  dynamic response;
  LoginSuccess({required this.response});
}

class LoginFailed extends LoginState {
  String? message;
  LoginFailed({required this.message});
}
