// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircledArrowButton extends StatelessWidget {
  const CircledArrowButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    required this.color,
    required this.iconColor,
  }) : super(key: key);
  final VoidCallback onPressed;
  final IconData icon;
  final Color color;
  final Color iconColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48.w,
      height: 48.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: IconButton(
        icon: Icon(icon, color: iconColor),
        onPressed: onPressed,
      ),
    );
  }
}
