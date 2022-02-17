// ignore_for_file: must_be_immutable

import 'package:artisan/views/board/gig/domain/entity/gig/gig_entity.dart';

class MilestoneEntity extends GigEntity {
  String? description;
  String? dueDate;
  String? amount;

  MilestoneEntity({
    this.description,
    this.dueDate,
    this.amount,
  });

  Map<String, dynamic> toMap() {
    return {
      'description': description,
      'due_date': dueDate,
      'amount': amount,
    };
  }
}
