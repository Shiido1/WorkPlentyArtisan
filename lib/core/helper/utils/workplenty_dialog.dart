import 'package:artisan/views/widgets/buttons.dart';
import 'package:artisan/views/widgets/image_loader.dart';
import 'package:artisan/views/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:overlay_support/overlay_support.dart';

import 'pallets.dart';

class WorkPlenty {
  static void showLoading(BuildContext context, GlobalKey key,
      [String message = 'Loading...']) async {
    final dialog = Dialog(
      key: key,
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SpinKitFadingCircle(
            color: Pallets.lightBlue50,
            size: 50.0,
          ),
          // SizedBox(height: 16.h),
          // TextView(text: message)
        ],
      ),
    );

    await showDialog(
      context: context,
      builder: (BuildContext context) => dialog,
      barrierDismissible: false,
    );
  }

  static void hideLoading(GlobalKey key) {
    if (key.currentContext != null) {
      Navigator.of(key.currentContext!, rootNavigator: true).pop();
    } else {
      Future.delayed(Duration(milliseconds: 300)).then((value) =>
          Navigator.of(key.currentContext!, rootNavigator: true).pop());
    }
  }

  static Widget getLoading({double size = 50.0}) => Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: SpinKitCubeGrid(color: Pallets.blue, size: size),
      );

  static void showSuccessDialog(
    BuildContext context,
    GlobalKey key, {
    String? image,
    required String btnText,
    required String title,
    required String message,
    void Function()? next,
  }) async {
    var future = Future.delayed(const Duration(seconds: 5));
    var subscription = future.asStream().listen((_) {
      if (key.currentContext != null) {
        Navigator.of(key.currentContext!, rootNavigator: true).pop();
      }
    });

    final dialog = AlertDialog(
      key: key,
      backgroundColor: Colors.transparent,
      elevation: 0,
      scrollable: true,
      content: Container(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        width: double.maxFinite,
        constraints: const BoxConstraints(maxWidth: 340),
        decoration: BoxDecoration(
          color: Pallets.white,
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            image != null
                ? ImageLoader(height: 180.h, width: 180.w, path: image)
                : CircleAvatar(
                    radius: 32,
                    backgroundColor: Pallets.blue.withOpacity(0.4),
                    child: Icon(Icons.check, size: 40, color: Pallets.blue),
                  ),
            SizedBox(height: 30.h),
            TextView(
              text: title,
              textAlign: TextAlign.center,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
            SizedBox(height: 4.h),
            TextView(
              text: message,
              textAlign: TextAlign.center,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(height: 30.h),
            ButtonWidget(
                width: 246.w,
                buttonText: btnText,
                color: Pallets.white,
                onPressed: next ??
                    () {
                      Navigator.of(key.currentContext!, rootNavigator: true)
                          .pop();
                      subscription.cancel();
                    }),
          ],
        ),
      ),
    );

    await showDialog(
      context: context,
      builder: (BuildContext context) => dialog,
      barrierDismissible: false,
    ).then((_) {
      if (next != null) {
        next();
      }
    });
  }

  static void showSnackBar(
    BuildContext context,
    String message, {
    void Function()? onClose,
    bool error = false,
  }) {
    final snackBar = SnackBar(
      content: TextView(text: message),
      backgroundColor: !error ? Pallets.blue : Colors.red,
      duration: const Duration(seconds: 5),
      action: SnackBarAction(
        label: 'CLOSE',
        textColor: Colors.white,
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          if (onClose != null) {
            onClose();
          }
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  /// show success notification
  static success(String message) {
    // show a notification at top of screen.
    showSimpleNotification(
        Row(
          children: [
            Icon(Icons.check_circle, color: Pallets.green700),
            SizedBox(width: 12.w),
            Expanded(
              child: TextView(
                  text: message,
                  fontSize: 14,
                  color: Pallets.green600,
                  fontWeight: FontWeight.w500,
                  maxLines: 1,
                  textAlign: TextAlign.left),
            ),
          ],
        ),
        background: Pallets.white);
  }

  /// show success notification
  static error(String message) {
    // show a notification at top of screen.

    // show a notification at top of screen.
    showSimpleNotification(
        Row(
          children: [
            Icon(Icons.clear, color: Colors.white),
            SizedBox(width: 12.w),
            Expanded(
              child: TextView(
                  text: message,
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  maxLines: 1,
                  textAlign: TextAlign.left),
            ),
          ],
        ),
        background: Colors.redAccent);
  }
}
