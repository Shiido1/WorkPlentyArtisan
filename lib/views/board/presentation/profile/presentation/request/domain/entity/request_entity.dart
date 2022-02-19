// ignore_for_file: must_be_immutable

import 'package:artisan/core/entity/default_response.dart';
import 'package:artisan/core/enums/gig_type.dart';

class RequestEntity extends DefaultResponse {
  final int? requestID;
  final String? action;
  final GigType? type;
  final int? pagination;
  final String? status;

  RequestEntity(
      {this.requestID, this.action, this.type, this.pagination, this.status});

  Map<String, dynamic> toReply() {
    return {'request_id': requestID, 'action': action};
  }
}
