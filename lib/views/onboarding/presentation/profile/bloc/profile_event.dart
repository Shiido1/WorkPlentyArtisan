part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class BioProfileUpdate extends ProfileEvent {
  final ProfileEntity entity;

  const BioProfileUpdate(this.entity);
}

class LocationProfileUpdate extends ProfileEvent {
  final ProfileEntity entity;

  const LocationProfileUpdate(this.entity);
}

class AvatarProfileUpdate extends ProfileEvent {
  final ProfileEntity entity;

  const AvatarProfileUpdate(this.entity);
}
