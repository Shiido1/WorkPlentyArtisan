import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:artisan/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'utils/pallets.dart';

class Utils {
  /// get device width
  static double getDeviceWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  /// get device height
  static double getDeviceHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  /// show snackbar
  static void showsnackBarInfo(BuildContext? context,
      {required message, Color? bgColor}) {
    ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: bgColor ?? Pallets.blue50,
    ));
  }

  /// format date
  static String fomartDate(String date) {
    DateTime _dt = DateTime.parse(date);
    return DateFormat("dd MMM, yyyy").format(_dt);
  }

  /// format time
  static String getTodaysDateTime() {
    DateTime now = DateTime.now();
    return DateFormat('dd MMMM yyyy - HH:MM a').format(now);
  }

  /// formart complete date
  static String fomartCompleteDate(String date) {
    DateTime _dt = DateTime.parse(date);
    // return DateFormat('EEE, MMM d, ''yy').format(_dt);
    return DateFormat('EEE d MMMM, yyyy').format(_dt);
  }

  /// formart age
  static int getAge(String date) {
    return DateTime.now().year - DateTime.parse(date).year;
  }

  /// format currency
  static String formatCurrency(dynamic i) {
    return NumberFormat.simpleCurrency().format(i).replaceAll('.00', '');
  }

//* getting local path
  static Future<Directory?> findLocalPath() async {
    final directory = Platform.isAndroid
        ? await getExternalStorageDirectory()
        : await getApplicationDocumentsDirectory();
    return directory;
  }

//* generate key
  final _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  final Random _rnd = Random();

  String generateKey(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

//* generate id's
  int generateId(int length) => _rnd.nextInt(length);

  /// get file path
  static String getFileName(File file) {
    return basename(file.path);
  }

  /// percentage calculations
  static double getPercentage({num? directReferred, num? directRequired}) {
    double _answer = directReferred! / directRequired!;
    double _percentage = _answer * 100;
    return double.parse(_percentage.toStringAsPrecision(2)) / 100;
  }

  static void copyToClipBoard(BuildContext? context, String text) {
    Clipboard.setData(ClipboardData(text: text));
    showsnackBarInfo(context, message: 'Copied to clip board');
  }

  /// show success notification
  static success(String message) {
    // show a notification at top of screen.
    showSimpleNotification(
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
          decoration: BoxDecoration(
              color: Pallets.successLight,
              borderRadius: BorderRadius.circular(20.r)),
          child: Row(
            children: [
              CircleAvatar(
                radius: 15.r,
                backgroundColor: Pallets.white,
                child: Icon(Icons.check, color: Pallets.success),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: TextView(
                    text: message,
                    fontSize: 14,
                    color: Pallets.success,
                    fontWeight: FontWeight.w500,
                    maxLines: 1,
                    textAlign: TextAlign.left),
              ),
            ],
          ),
        ),
        background: Pallets.white);
  }

  /// show success notification
  static error(String message) {
    // show a notification at top of screen.
    showSimpleNotification(
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
          decoration: BoxDecoration(
              color: Pallets.error.withOpacity(.2),
              borderRadius: BorderRadius.circular(20.r)),
          child: Row(
            children: [
              CircleAvatar(
                radius: 15.r,
                backgroundColor: Pallets.white,
                child: Icon(Icons.clear, color: Pallets.error),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: TextView(
                    text: message,
                    fontSize: 14,
                    color: Pallets.error,
                    fontWeight: FontWeight.w500,
                    maxLines: 1,
                    textAlign: TextAlign.left),
              ),
            ],
          ),
        ),
        background: Pallets.white);
  }

  /// READ LOCAL JSON FOR {COUNTRIES}
  static Future<Map<String, dynamic>> parseCountryJson() async {
    String jsonString =
        await rootBundle.loadString("assets/json/country_states.json");
    return jsonDecode(jsonString);
  }
}
