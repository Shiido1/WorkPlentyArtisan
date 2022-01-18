// ignore_for_file: must_be_immutable

part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisteringEvent extends RegisterEvent {
  RegisterEntity? entity;

  RegisteringEvent({this.entity});
}
