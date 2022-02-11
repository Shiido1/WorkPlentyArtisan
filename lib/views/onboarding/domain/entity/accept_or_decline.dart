import 'package:equatable/equatable.dart';

class AcceptOrDeclineBidEntity extends Equatable {
  final String? bidId;
  final String? action;
  final String? message;

  AcceptOrDeclineBidEntity({this.bidId, this.action, this.message});

  @override
  List<Object> get props => [bidId!, action!, message!];

  Map<String, dynamic> toMap() {
    return {
      'bidId': bidId,
      'action': action,
      'message': message,
    };
  }

  @override
  String toString() =>
      'AcceptOrDeclineBidEntity(bidId: $bidId, action: $action, message: $message)';
}
