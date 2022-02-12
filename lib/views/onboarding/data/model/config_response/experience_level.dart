import 'package:json_annotation/json_annotation.dart';

import 'option.dart';

part 'experience_level.g.dart';

@JsonSerializable()
class ExperienceLevel {
  String? label;
  List<Option>? option;

  ExperienceLevel({this.label, this.option});

  factory ExperienceLevel.fromJson(Map<String, dynamic> json) {
    return _$ExperienceLevelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ExperienceLevelToJson(this);
}
