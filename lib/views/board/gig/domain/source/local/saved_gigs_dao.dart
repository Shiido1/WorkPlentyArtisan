// ignore_for_file: prefer_for_elements_to_map_fromiterable

import 'dart:async';
import 'dart:convert';

import 'package:artisan/core/database/hive_database.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../../../core/entity/datum/datum.dart';

SavedGigsDao? savedGigsDao;

class SavedGigsDao {
  Box<Map>? _box;

  Box<Map>? get box => _box;

  SavedGigsDao() {
    openBox().then((value) => _box = value);
  }

  Future<Box<Map>> openBox() => HiveBoxes.openBox<Map>(HiveBoxes.savedGigs);

  Future<void> listOfSavedGigs(List<Datum>? data) async {
    await _box?.clear();

    final map = Map<String, Map>.fromIterable(
      data!,
      key: (g) => (g as Datum).id.toString(),
      value: (g) => (g as Datum).toJson(),
    );
    await _box!.putAll(map);
  }

  List<Datum> getConvertedData(Box box) {
    Map<String, dynamic> raw = Map<String, dynamic>.from(box.toMap());
    return raw.values
        .map((e) => Datum.fromJson(json.decode(json.encode(e))))
        .toList();
  }

  Future<ValueListenable<Box>?> getListenable({List<String>? keys}) async {
    await openBox();
    return keys == null ? _box?.listenable() : _box?.listenable(keys: keys);
  }

  Future clearDb() async {
    await _box?.clear();
  }
}
