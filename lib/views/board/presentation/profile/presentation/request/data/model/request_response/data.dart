import 'package:artisan/views/board/presentation/profile/presentation/bids/data/model/list_of_bids_response/datum.dart';
import 'package:json_annotation/json_annotation.dart';

import 'pagination_meta.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  @JsonKey(name: 'pagination_meta')
  PaginationMeta? paginationMeta;
  List<Datum>? data;

  Data({this.paginationMeta, this.data});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
