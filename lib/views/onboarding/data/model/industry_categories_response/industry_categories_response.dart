import 'package:artisan/core/entity/default_response.dart';
import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'industry_categories_response.g.dart';

@JsonSerializable()
class IndustryCategoriesResponse extends DefaultResponse {
  String? msg;
  Data? data;
  bool? success;
  int? code;

  IndustryCategoriesResponse({
    this.msg,
    this.data,
    this.success,
    this.code,
  });

  factory IndustryCategoriesResponse.fromJson(Map<String, dynamic> json) {
    return _$IndustryCategoriesResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$IndustryCategoriesResponseToJson(this);
}
