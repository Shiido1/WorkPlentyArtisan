import 'package:artisan/core/entity/attachments/attachment.dart';
import 'package:artisan/core/entity/gig/gig.dart';
import 'package:artisan/core/entity/user/user.dart';
import 'package:artisan/views/board/gig/data/model/list_of_available_gigs_response/datum.dart'
    as gig;
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'datum.g.dart';

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: 0)
class Datum extends gig.Datum {
  @HiveField(0)
  int? id;
  @HiveField(1)
  Gig? gig;
  @HiveField(2)
  User? artisan;
  @HiveField(3)
  @JsonKey(name: 'cover_message')
  String? coverMessage;
  @HiveField(4)
  @JsonKey(name: 'payment_type')
  String? paymentType;
  @HiveField(5)
  String? reference;
  @HiveField(6)
  @JsonKey(name: 'payable_amount')
  int? payableAmount;
  @HiveField(7)
  String? status;
  @HiveField(8)
  @JsonKey(name: 'decline_message')
  dynamic declineMessage;
  @HiveField(9)
  @JsonKey(name: 'response_date')
  dynamic responseDate;
  @HiveField(10)
  List<Attachment>? attachments;
  @HiveField(11)
  @JsonKey(name: 'created_at')
  String? createdAt;
  @HiveField(12)
  @JsonKey(name: 'updated_at')
  String? updatedAt;

  Datum({
    this.id,
    this.gig,
    this.artisan,
    this.coverMessage,
    this.paymentType,
    this.reference,
    this.payableAmount,
    this.status,
    this.declineMessage,
    this.responseDate,
    this.attachments,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}
