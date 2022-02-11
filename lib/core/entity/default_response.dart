// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class DefaultResponse extends Equatable {
  String? msg;
  int? code;
  bool? success;
  dynamic errorDebug;

  DefaultResponse({this.msg, this.code, this.success, this.errorDebug});

  factory DefaultResponse.fromJson(Map<String, dynamic> json) {
    return DefaultResponse(
      msg: json['msg'] as String?,
      code: json['code'] as int?,
      success: json['success'] as bool?,
      errorDebug: json['error_debug'] as dynamic,
    );
  }

  Map<String, dynamic> toJson() => {
        'msg': msg,
        'code': code,
        'success': success,
        'error_debug': errorDebug,
      };

  @override
  List<Object?> get props => throw UnimplementedError();
}
