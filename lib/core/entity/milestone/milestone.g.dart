// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'milestone.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Milestone _$MilestoneFromJson(Map<String, dynamic> json) => Milestone(
      id: json['id'] as int?,
      description: json['description'] as String?,
      dueDate: json['due_date'] as String?,
      amount: json['amount'] as int?,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$MilestoneToJson(Milestone instance) => <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'due_date': instance.dueDate,
      'amount': instance.amount,
      'created_at': instance.createdAt,
    };
