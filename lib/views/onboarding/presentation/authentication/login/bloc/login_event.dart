// ignore_for_file: must_be_immutable

part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginingEvent extends LoginEvent {
  LoginEntity? entity;

  LoginingEvent({this.entity});
}
