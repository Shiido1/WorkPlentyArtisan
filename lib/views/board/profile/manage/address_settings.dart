import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:artisan/views/widgets/body_widget.dart';
import 'package:artisan/views/widgets/buttons.dart';
import 'package:artisan/views/widgets/default_appbar.dart';
import 'package:artisan/views/widgets/edit_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressSettings extends StatefulWidget {
  AddressSettings({Key? key}) : super(key: key);

  @override
  _AddressSettingsState createState() => _AddressSettingsState();
}

class _AddressSettingsState extends State<AddressSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: defaultAppBar2(context,
          title: 'Address Settings',
          centerTitle: true,
          textColor: Pallets.white),
      body: BodyWidget(
          child: Stack(
        children: [
          ListView(
            children: [
              EditFormField(
                decoration: _getDecoration('Country', dropDown: true),
              ),
              SizedBox(height: 16.h),
              EditFormField(
                decoration: _getDecoration('State', dropDown: true),
              ),
              SizedBox(height: 16.h),
              EditFormField(
                decoration: _getDecoration('Stree Address', dropDown: false),
              ),
              SizedBox(height: 16.h),
              EditFormField(
                decoration: _getDecoration('Apt./ Suite', dropDown: false),
              ),
              SizedBox(height: 16.h),
              EditFormField(
                decoration: _getDecoration('City', dropDown: false),
              ),
              SizedBox(height: 16.h),
              EditFormField(
                decoration: _getDecoration('ZIP/Postal Code', dropDown: true),
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
