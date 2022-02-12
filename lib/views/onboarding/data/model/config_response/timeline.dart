import 'package:json_annotation/json_annotation.dart';

import 'option.dart';

part 'timeline.g.dart';

@JsonSerializable()
class Timeline {
  String? label;
  List<Option>? option;

  Timeline({this.label, this.option});

  factory Timeline.fromJson(Map<String, dynamic> json) {
    return _$TimelineFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TimelineToJson(this);
}
