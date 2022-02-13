import 'package:artisan/core/entity/cover/cover.dart';
import 'package:json_annotation/json_annotation.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum {
  int? id;
  String? name;
  Cover? cover;
  @JsonKey(name: 'category_id')
  dynamic categoryId;

  Datum({this.id, this.name, this.cover, this.categoryId});

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}
