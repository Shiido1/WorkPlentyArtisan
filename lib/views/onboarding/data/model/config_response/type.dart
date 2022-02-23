import 'package:json_annotation/json_annotation.dart';

import 'option.dart';

part 'type.g.dart';

@JsonSerializable(explicitToJson: true)
class Type {
  String? label;
  List<Option>? option;

  Type({this.label, this.option});

  factory Type.fromJson(Map<String, dynamic> json) => _$TypeFromJson(json);

  Map<String, dynamic> toJson() => _$TypeToJson(this);
}
