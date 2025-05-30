// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insighta/core/theming/colors.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    super.key,
    required this.onPressed,
    this.backgroundColor,
    this.borderRadius,
    required this.text,
    required this.textStyle,
    this.verticalPadding,
    this.horizontalPadding,
    this.buttonwidth,
    this.buttonheight,
  });
  final void Function() onPressed;
  final Color? backgroundColor;
  final double? borderRadius;
  final String text;
  final TextStyle textStyle;
  final double? verticalPadding;
  final double? horizontalPadding;
  final double? buttonwidth;
  final double? buttonheight;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
              backgroundColor ?? ColorsManager.primaryColor),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 16),
            ),
          ),
          padding: WidgetStateProperty.all<EdgeInsets>(
            EdgeInsets.symmetric(
              horizontal: horizontalPadding?.w ?? 12.w,
              vertical: verticalPadding?.h ?? 14.h,
            ),
          ),
          fixedSize: WidgetStateProperty.all(
            Size(buttonwidth?.w ?? double.maxFinite, buttonheight?.h ?? 50.h),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: textStyle,
        ));
  }
}
