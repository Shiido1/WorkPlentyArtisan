// ignore_for_file: must_be_immutable

import 'package:artisan/core/entity/default_response.dart';
import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'list_of_available_gigs_response.g.dart';

@JsonSerializable(explicitToJson: true)
class ListOfAvailableGigsResponse extends DefaultResponse {
  String? msg;
  Data? data;
  bool? success;
  int? code;

  ListOfAvailableGigsResponse({
    this.msg,
    this.data,
    this.success,
    this.code,
  });

  factory ListOfAvailableGigsResponse.fromJson(Map<String, dynamic> json) {
    return _$ListOfAvailableGigsResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ListOfAvailableGigsResponseToJson(this);
}
