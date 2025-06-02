// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:insighta/core/theming/colors.dart';
import 'package:insighta/core/utils/styles.dart';

class AppTextFormField extends StatelessWidget {
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String? hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? backgroundColor;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool? autoFocus;
  final bool? enabled;
  final bool? autoCorrect;
  final bool? enableSuggestions;
  final String? initialValue;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final void Function(String?)? onSaved;
  final Iterable<String>? autofillHints;
  final int? maxLines;
  final int? minLines;
  final double? borderRadius;
  final InputDecoration? decoration;
  final Color? borderColor;
  final List<TextInputFormatter>? inputFormatters;
  final InputBorder? border;

  const AppTextFormField({
    super.key,
    this.width,
    this.height,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.prefixIcon,
    this.backgroundColor,
    this.keyboardType,
    this.textInputAction,
    this.validator,
    this.controller,
    this.focusNode,
    this.autoFocus,
    this.enabled,
    this.autoCorrect,
    this.enableSuggestions,
    this.initialValue,
    this.onChanged,
    this.onFieldSubmitted,
    this.onSaved,
    this.autofillHints,
    this.maxLines,
    this.minLines,
    this.borderRadius,
    this.decoration,
    this.borderColor,
    this.inputFormatters,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height,
      child: TextFormField(
        cursorColor: ColorsManager.primaryColor,
        controller: controller,
        focusNode: focusNode,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        validator: validator,
        autofocus: autoFocus ?? false,
        enabled: enabled ?? true,
        obscureText: isObscureText ?? false,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        autocorrect: autoCorrect ?? true,
        enableSuggestions: enableSuggestions ?? true,
        initialValue: initialValue,
        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted,
        onSaved: onSaved,
        maxLines: maxLines ?? 1,
        minLines: minLines ?? 1,
        style: inputTextStyle ??
            Styles.textStyle14P.copyWith(color: ColorsManager.primaryColor),
        autofillHints: autofillHints,
        inputFormatters: inputFormatters,
        decoration: decoration ??
            InputDecoration(
              isDense: true,
              border: border,
              contentPadding: contentPadding ??
                  EdgeInsets.symmetric(
                    vertical: 16.h,
                    horizontal: 20.w,
                  ),
              enabledBorder: enabledBorder ??
                  buildOutlineInputBorder(
                      color: borderColor ?? ColorsManager.textFieldBorder),
              focusedBorder: focusedBorder ??
                  buildOutlineInputBorder(
                      color: borderColor ?? ColorsManager.primaryColor),
              focusedErrorBorder: buildOutlineInputBorder(color: Colors.red),
              errorBorder: buildOutlineInputBorder(color: Colors.red),
              hintStyle: hintStyle ??
                  Styles.textStyle14P.copyWith(
                    color: ColorsManager.hintText,
                  ),
              hintText: hintText,
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon != null
                  ? Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: prefixIcon,
                    )
                  : null,
              fillColor: backgroundColor ?? ColorsManager.searchField,
              filled: true,
            ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder({required Color color}) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color, width: 1.4),
      borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
    );
  }
}
