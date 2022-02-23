import 'package:json_annotation/json_annotation.dart';

import 'option.dart';

part 'cover_letter.g.dart';

@JsonSerializable(explicitToJson: true)
class CoverLetter {
  String? label;
  List<Option>? option;

  CoverLetter({this.label, this.option});

  factory CoverLetter.fromJson(Map<String, dynamic> json) {
    return _$CoverLetterFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CoverLetterToJson(this);
}
