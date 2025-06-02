// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:insighta/core/theming/colors.dart';
import 'package:insighta/core/utils/styles.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final String hintText;
  final TextStyle? hintStyle;
  final bool? isobscureText;
  final Widget? suffixIcon;
  final Color? fillColor;
  final TextEditingController? controller;
  final String? Function(String?) validator;
  const AppTextFormField({
    Key? key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    required this.hintText,
    this.hintStyle,
    this.isobscureText,
    this.suffixIcon,
    this.fillColor,
    this.controller,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        fillColor: fillColor ?? ColorsManager.searchField,
        filled: true,
        isDense: true,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 18.h,
            ),
        focusedBorder: focusedBorder ??
            buildOutlineInputBorder(color: ColorsManager.primaryColor),
        enabledBorder: enabledBorder ??
            buildOutlineInputBorder(color: ColorsManager.textFieldBorder),
        focusedErrorBorder: buildOutlineInputBorder(color: Colors.red),
        errorBorder: buildOutlineInputBorder(color: Colors.red),
        hintText: hintText,
        hintStyle: hintStyle ??
            Styles.textStyle14P.copyWith(color: ColorsManager.hintText),
        suffixIcon: suffixIcon,
      ),
      obscureText: isobscureText ?? false,
      style: Styles.textStyle14P.copyWith(
        color: ColorsManager.primaryColor,
      ),
      validator: (value) {
        return validator(value);
      },
    );
  }
}

OutlineInputBorder buildOutlineInputBorder({required Color color}) {
  return OutlineInputBorder(
    borderSide: BorderSide(color: color, width: 1.4.w),
    borderRadius: BorderRadius.circular(12.r),
  );
}
