import 'package:json_annotation/json_annotation.dart';

import 'option.dart';

part 'payment_type.g.dart';

@JsonSerializable(explicitToJson: true)
class PaymentType {
  String? label;
  List<Option>? option;

  PaymentType({this.label, this.option});

  factory PaymentType.fromJson(Map<String, dynamic> json) {
    return _$PaymentTypeFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PaymentTypeToJson(this);
}
