// ignore_for_file: must_be_immutable

part of 'password_bloc.dart';

abstract class PasswordEvent extends Equatable {
  const PasswordEvent();

  @override
  List<Object> get props => [];
}

class ForgotPasswordEvent extends PasswordEvent {
  ForgotPasswordEntity? entity;

  ForgotPasswordEvent({this.entity});
}

class ResetPasswordEvent extends PasswordEvent {
  ResetPasswordEntity? entity;

  ResetPasswordEvent({this.entity});
}
