// ignore_for_file: must_be_immutable

import 'package:dio/dio.dart';

import 'package:artisan/core/entity/default_response.dart';

class ProfileEntity extends DefaultResponse {
  final String? title;
  final String? description;
  final String? gender;
  final MultipartFile? avatar;
  final String? country;
  final int? countryID;
  final int? stateId;
  final String? state;
  final String? lga;
  final String? city;
  final String? zipcode;
  final String? address;
  final String? appartment;
  final List<String>? skills;
  final int? experienceLevel;
  final String? school;
  final String? fieldOfStudy;
  final String? degree;
  final String? attendedFrom;
  final String? attendedTo;
  final String? company;
  final String? position;
  final int? currentleHere;
  final String? startedOn;
  final String? endedOn;
  final String? location;

  ProfileEntity({
    this.title,
    this.description,
    this.gender,
    this.avatar,
    this.country,
    this.countryID,
    this.stateId,
    this.state,
    this.lga,
    this.city,
    this.zipcode,
    this.address,
    this.appartment,
    this.skills,
    this.experienceLevel,
    this.school,
    this.fieldOfStudy,
    this.degree,
    this.attendedFrom,
    this.attendedTo,
    this.company,
    this.position,
    this.currentleHere,
    this.startedOn,
    this.endedOn,
    this.location,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'gender': gender,
    };
  }

  Map<String, dynamic> toAvatar() {
    return {'avatar': avatar};
  }

  Map<String, dynamic> toLocation() {
    return {
      'country': country,
      'state': state,
      'lga': lga,
      'city': city,
      'zipcode': zipcode,
      'address': address,
      'country_id': countryID,
      'state_id': stateId,
      'appartment': appartment
    };
  }

  Map<String, dynamic> toSkills() => {'skills': skills};

  Map<String, dynamic> toExperience() =>
      {'experience_level': '$experienceLevel'};

  Map<String, dynamic> toEducation() => {
        'school': school,
        'field_of_study': fieldOfStudy,
        'degree': degree,
        'attended_from': attendedFrom,
        'attended_to': attendedTo
      };

  Map<String, dynamic> toWorkHistory() => {
        'company': company,
        'position': position,
        'currently_here': '$currentleHere',
        'started_on': startedOn,
        'ended_on': endedOn,
        'location': location
      };
}
