part of 'password_bloc.dart';

abstract class PasswordState extends Equatable {
  const PasswordState();

  @override
  List<Object> get props => [];
}

class PasswordInitial extends PasswordState {}

class PasswordLoading extends PasswordState {}

class PasswordSuccess extends PasswordState {
  dynamic response;
  PasswordSuccess({required this.response});
}

class PasswordFailed extends PasswordState {
  String? message;
  PasswordFailed({required this.message});
}
