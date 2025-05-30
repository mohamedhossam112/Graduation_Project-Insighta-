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
  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    required this.hintText,
    this.hintStyle,
    this.isobscureText,
    this.suffixIcon,
    this.fillColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide:
                    BorderSide(color: ColorsManager.primaryColor, width: 1.4.w),
              ),
          enabledBorder: enabledBorder ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(
                    color: ColorsManager.textFieldBorder, width: 1.4.w),
              ),
          hintText: hintText,
          hintStyle: hintStyle ??
              Styles.textStyle14P.copyWith(color: ColorsManager.hintText),
          suffixIcon: suffixIcon,
        ),
        obscureText: isobscureText ?? false,
        style: Styles.textStyle14P.copyWith(
          color: ColorsManager.primaryColor,
        ));
  }
}
