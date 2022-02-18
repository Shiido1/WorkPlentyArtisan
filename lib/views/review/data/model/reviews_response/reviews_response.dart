// ignore_for_file: must_be_immutable

import 'package:artisan/views/review/domain/entity/review_entity.dart';
import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'reviews_response.g.dart';

@JsonSerializable(explicitToJson: true)
class ReviewsResponse extends ReviewEntity {
  String? msg;
  Data? data;
  bool? success;
  int? code;

  ReviewsResponse({this.msg, this.data, this.success, this.code});

  factory ReviewsResponse.fromJson(Map<String, dynamic> json) {
    return _$ReviewsResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ReviewsResponseToJson(this);
}
