import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:artisan/views/widgets/body_widget.dart';
import 'package:artisan/views/widgets/buttons.dart';
import 'package:artisan/views/widgets/default_appbar.dart';
import 'package:artisan/views/widgets/edit_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountSettings extends StatefulWidget {
  AccountSettings({Key? key}) : super(key: key);

  @override
  _AccountSettingsState createState() => _AccountSettingsState();
}

class _AccountSettingsState extends State<AccountSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: defaultAppBar2(context,
          title: 'Account Settings',
          centerTitle: true,
          textColor: Pallets.white),
      body: BodyWidget(
          child: Stack(
        children: [
          ListView(
            children: [
              SizedBox(height: 55.h),
              EditFormField(
                decoration: _getDecoration('Full Name', dropDown: false),
              ),
              SizedBox(height: 20.h),
              EditFormField(
                decoration: _getDecoration('Username', dropDown: false),
              ),
              SizedBox(height: 20.h),
              EditFormField(
                decoration: _getDecoration('Email Address', dropDown: false),
              ),
              SizedBox(height: 20.h),
              EditFormField(
                decoration: _getDecoration('Phone Number', dropDown: false),
              ),
              SizedBox(height: 20.h),
              EditFormField(
                decoration: _getDecoration('User Type', dropDown: true),
              ),
            ],
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: ButtonWidget(
                  buttonText: 'Save Details', onPressed: () => null)),
        ],
      )),
    );
  }

  _getDecoration(String hint, {bool? dropDown}) {
    return InputDecoration(
        border:
            UnderlineInputBorder(borderSide: BorderSide(color: Pallets.grey)),
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Pallets.grey)),
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Pallets.grey)),
        errorBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
        disabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Pallets.grey)),
        labelText: hint,
        suffixIcon: dropDown! ? Icon(Icons.keyboard_arrow_down) : null);
  }
}
