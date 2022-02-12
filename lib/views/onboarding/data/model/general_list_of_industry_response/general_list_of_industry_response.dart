import 'package:artisan/core/entity/default_response.dart';
import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'general_list_of_industry_response.g.dart';

@JsonSerializable()
class GeneralListOfIndustryResponse extends DefaultResponse {
  String? msg;
  List<Datum>? data;
  bool? success;
  int? code;

  GeneralListOfIndustryResponse({
    this.msg,
    this.data,
    this.success,
    this.code,
  });

  factory GeneralListOfIndustryResponse.fromJson(Map<String, dynamic> json) {
    return _$GeneralListOfIndustryResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GeneralListOfIndustryResponseToJson(this);
}
