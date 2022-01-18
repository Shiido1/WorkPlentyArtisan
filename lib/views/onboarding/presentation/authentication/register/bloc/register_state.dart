// ignore_for_file: must_be_immutable

part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  dynamic response;
  RegisterSuccess({required this.response});
}

class RegisterFailed extends RegisterState {
  String? message;
  RegisterFailed({required this.message});
}
