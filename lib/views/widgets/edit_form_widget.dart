// ignore_for_file: prefer_if_null_operators

import 'package:artisan/core/helper/utils/pallets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class EditFormField extends StatelessWidget {
  EditFormField(
      {Key? key,
      this.label = '',
      this.hint = '',
      this.floatingLabel = '',
      this.prefixIcon,
      this.suffixIcon,
      this.onSaved,
      this.validator,
      this.controller,
      this.alignLabelWithHint = false,
      this.onPasswordToggle,
      this.initialValue,
      this.autoValidateMode = AutovalidateMode.disabled,
      this.autocorrect = true,
      this.enabled = true,
      this.obscureText = false,
      this.readOnly = false,
      this.onTapped,
      this.keyboardType,
      this.suffixWidget,
      this.maxLines = 1,
      this.minLines = 1,
      this.maxLength,
      this.floatingLabelBehavior = FloatingLabelBehavior.never,
      this.inputFormatters,
      this.focusedColorBorder,
      this.suffixIconColor,
      this.labelStyle,
      this.hintStyle,
      this.textStyle,
      this.decoration,
      this.onChange,
      this.edgeInsetsGeometry,
      this.textCapitalization = TextCapitalization.none,
      this.formKey,
      this.focusNode,
      this.textInputAction = TextInputAction.next,
      this.clickable,
      this.prefixIconColor,
      this.fillColor = true,
      this.counterLength = 0,
      this.isTyping = false,
      this.autoValidate = false,
      this.showMaxLengthCounter = false,
      this.radius = 5,
      this.height,
      this.prefixWidget})
      : super(key: key);

  final TextCapitalization? textCapitalization;
  final String? label;
  final String? floatingLabel;
  final String? hint;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Widget? suffixWidget;
  final Widget? prefixWidget;

  final FormFieldSetter<String>? onSaved;
  final Function(String)? onChange;
  final FormFieldValidator<String>? validator;
  final VoidCallback? onPasswordToggle;

  final String? initialValue;
  final TextEditingController? controller;
  final FloatingLabelBehavior? floatingLabelBehavior;

  final bool? autocorrect;
  final AutovalidateMode? autoValidateMode;
  final bool? enabled;
  final bool? obscureText;
  final bool? readOnly;
  final bool? alignLabelWithHint;
  final bool? isTyping;

  final bool? clickable;
  final Function()? onTapped;

  final TextInputType? keyboardType;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final double? height;
  final TextInputFormatter? inputFormatters;

  final Color? focusedColorBorder;
  final Color? suffixIconColor;
  final Color? prefixIconColor;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final TextInputAction? textInputAction;
  final InputDecoration? decoration;
  final Key? formKey;

  final EdgeInsetsGeometry? edgeInsetsGeometry;
  final FocusNode? focusNode;
  bool fillColor;
  bool autoValidate;
  bool showMaxLengthCounter;
  final int counterLength;
  double radius;

  @override
  Widget build(BuildContext context) {
    return height == null
        ? _editFormWithNoHeight(context)
        : _editFormWithHeight(context);
  }

  _editFormWithNoHeight(BuildContext context) {
    return TextFormField(
      readOnly: readOnly!,
      onTap: onTapped,
      key: formKey,
      cursorColor: Pallets.primary100,
      keyboardType: keyboardType,
      enabled: enabled,
      focusNode: focusNode,
      textInputAction: textInputAction,
      textCapitalization: textCapitalization!,
      autovalidateMode: autoValidateMode,
      onSaved: onSaved,
      onChanged: onChange,
      maxLines: maxLines,

      // autovalidate: autoValidate,
      style: GoogleFonts.dmSans(
          fontWeight: FontWeight.w400,
          fontSize: 14.sp,
          fontStyle: FontStyle.normal),
      autocorrect: autocorrect!,
      minLines: minLines,
      obscureText: obscureText!,
      maxLength: maxLength,
      validator: validator,
      initialValue: initialValue,
      controller: controller,
      decoration: decoration ??
          InputDecoration(
              counterText: '',
              counter: showMaxLengthCounter
                  ? Text(
                      '$counterLength/$maxLength characters',
                      style: const TextStyle(color: Colors.green),
                    )
                  : null,
              fillColor: Colors.transparent,
              filled: fillColor,
              floatingLabelBehavior: floatingLabelBehavior,
              alignLabelWithHint: alignLabelWithHint,
              errorStyle: const TextStyle(color: Colors.red),
              contentPadding: edgeInsetsGeometry ??
                  EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
              hintText: hint,
              hintStyle: hintStyle ??
                  GoogleFonts.dmSans(
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                      fontStyle: FontStyle.normal),
              labelText: label,
              labelStyle: labelStyle ??
                  GoogleFonts.dmSans(
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                      fontStyle: FontStyle.normal),
              prefixIcon: prefixWidget != null
                  ? prefixWidget
                  : prefixIcon != null
                      ? IconButton(
                          onPressed: onPasswordToggle,
                          icon: Icon(
                            prefixIcon,
                            color: prefixIconColor,
                          ))
                      : null,
              suffixIcon: suffixWidget != null
                  ? suffixWidget
                  : suffixIcon != null
                      ? IconButton(
                          onPressed: onPasswordToggle,
                          icon: Icon(
                            suffixIcon,
                            color: suffixIconColor ??
                                Theme.of(context).iconTheme.color,
                          ))
                      : null),
    );
  }

  _editFormWithHeight(BuildContext context) {
    return Container(
      height: height!.h,
      decoration: BoxDecoration(
        border: Border.all(
            color: focusedColorBorder != null
                ? focusedColorBorder!
                : Pallets.primary100),
        borderRadius: BorderRadius.circular(radius),
      ),
      child: TextFormField(
        readOnly: readOnly!,
        onTap: onTapped,
        key: formKey,
        cursorColor: Pallets.green600,
        keyboardType: keyboardType,
        enabled: enabled,
        focusNode: focusNode,
        textInputAction: textInputAction,
        textCapitalization: textCapitalization!,
        autovalidateMode: autoValidateMode,
        onSaved: onSaved,
        onChanged: onChange,
        maxLines: maxLines,
        // autovalidate: autoValidate,
        style: GoogleFonts.inter(
            color: Pallets.grey500,
            fontWeight: FontWeight.w400,
            fontSize: 14.sp,
            fontStyle: FontStyle.normal),
        autocorrect: autocorrect!,
        minLines: minLines,
        obscureText: obscureText!,
        maxLength: maxLength,
        validator: validator,
        initialValue: initialValue,
        controller: controller,
        decoration: decoration ??
            InputDecoration(
              counterText: '',
              counter: showMaxLengthCounter
                  ? Text(
                      '$counterLength/$maxLength characters',
                      style: const TextStyle(color: Colors.green),
                    )
                  : null,
              floatingLabelBehavior: floatingLabelBehavior,
              alignLabelWithHint: alignLabelWithHint,
              errorStyle: const TextStyle(color: Colors.red),
              contentPadding: edgeInsetsGeometry ??
                  const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              hintText: hint,
              hintStyle: hintStyle ??
                  GoogleFonts.montserrat(
                      color: Pallets.grey500,
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      fontStyle: FontStyle.normal),
              labelText: label,
              labelStyle: labelStyle ??
                  GoogleFonts.inter(
                      color: Pallets.grey500,
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      fontStyle: FontStyle.normal),
              prefixIcon: prefixWidget != null
                  ? prefixWidget
                  : prefixIcon != null
                      ? IconButton(
                          onPressed: onPasswordToggle,
                          icon: Icon(
                            prefixIcon,
                            color: prefixIconColor,
                          ))
                      : null,
              suffixIcon: suffixWidget != null
                  ? suffixWidget
                  : suffixIcon != null
                      ? IconButton(
                          onPressed: onPasswordToggle,
                          icon: Icon(
                            suffixIcon,
                            color: Colors.red,
                          ))
                      : null,
            ),
      ),
    );
  }
}
