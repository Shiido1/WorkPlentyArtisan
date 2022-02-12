// ignore_for_file: must_be_immutable

import 'package:artisan/core/entity/default_response.dart';
import 'package:dio/dio.dart';

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

  ProfileEntity(
      {this.title,
      this.description,
      this.gender,
      this.avatar,
      this.country,
      this.lga,
      this.state,
      this.school,
      this.fieldOfStudy,
      this.degree,
      this.attendedFrom,
      this.attendedTo,
      this.city,
      this.countryID,
      this.stateId,
      this.zipcode,
      this.address,
      this.appartment,
      this.experienceLevel,
      this.skills});

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
}
