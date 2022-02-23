// ignore_for_file: prefer_for_elements_to_map_fromiterable

import 'dart:async';
import 'dart:convert';

import 'package:artisan/core/database/hive_database.dart';
import 'package:artisan/core/helper/utils/time_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../../../core/entity/datum/datum.dart';

AvailableGigsDao? availableGigsDao;

class AvailableGigsDao {
  Box<Map>? _box;

  Box<Map>? get box => _box;

  AvailableGigsDao() {
    openBox().then((value) => _box = value);
  }

  Future<Box<Map>> openBox() => HiveBoxes.openBox<Map>(HiveBoxes.availableGigs);

  Future<void> saveAvailableGigs(List<Datum>? data) async {
    if (data!.isNotEmpty) await _box?.clear();

    final map = Map<String, Map>.fromIterable(
      data,
      key: (g) => (g as Datum).id.toString(),
      value: (g) => (g as Datum).toJson(),
    );
    await _box!.putAll(map);
  }

  List<Datum> getConvertedData(Box box) {
    Map<String, dynamic> raw = Map<String, dynamic>.from(box.toMap());
    final _rawValues = raw.values
        .map((e) => Datum.fromJson(json.decode(json.encode(e))))
        .toList();

    _rawValues.sort(((a, b) => TimeUtil.rawTimeFormat(a.createdAt ?? '')
        .compareTo(TimeUtil.rawTimeFormat(b.createdAt ?? ''))));

    return _rawValues.toList().reversed.toList();
  }

  Future<ValueListenable<Box>?> getListenable({List<String>? keys}) async {
    await openBox();
    return keys == null ? _box?.listenable() : _box?.listenable(keys: keys);
  }

  Future clearDb() async {
    await _box?.clear();
  }
}
