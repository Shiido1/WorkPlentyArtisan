// ignore_for_file: must_be_immutable

import 'package:artisan/core/entity/default_response.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../../../../../../core/entity/data/data.dart';

part 'list_of_bids_response.g.dart';

@JsonSerializable(explicitToJson: true)
class ListOfBidsResponse extends DefaultResponse {
  String? msg;
  Data? data;
  bool? success;
  int? code;

  ListOfBidsResponse({this.msg, this.data, this.success, this.code});

  factory ListOfBidsResponse.fromJson(Map<String, dynamic> json) {
    return _$ListOfBidsResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ListOfBidsResponseToJson(this);
}
