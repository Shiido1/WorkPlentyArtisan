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

class SkillsProfileUpdate extends ProfileEvent {
  final ProfileEntity entity;

  const SkillsProfileUpdate(this.entity);
}

class UpdateExperience extends ProfileEvent {
  final ProfileEntity entity;

  const UpdateExperience(this.entity);
}

class UpdateEducation extends ProfileEvent {
  final ProfileEntity entity;

  const UpdateEducation(this.entity);
}

class UpdateWorkExperience extends ProfileEvent {
  final ProfileEntity entity;

  const UpdateWorkExperience(this.entity);
}
