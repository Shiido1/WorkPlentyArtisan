// ignore_for_file: must_be_immutable

import 'package:artisan/views/review/domain/entity/review_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'reviews_response.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class ReviewsResponse extends ReviewEntity {
  @HiveField(0)
  String? msg;
  @HiveField(1)
  Data? data;
  @HiveField(2)
  bool? success;
  @HiveField(3)
  int? code;

  ReviewsResponse({this.msg, this.data, this.success, this.code});

  factory ReviewsResponse.fromJson(Map<String, dynamic> json) {
    return _$ReviewsResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ReviewsResponseToJson(this);
}
