part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

// ignore: must_be_immutable
class ProfileSuccess extends ProfileState {
  dynamic response;
  ProfileSuccess({required this.response});
}

class ProfileFailed extends ProfileState {
  final String message;
  ProfileFailed({required this.message});
}
