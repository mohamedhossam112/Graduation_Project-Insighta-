// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuggestCard extends StatelessWidget {
  const SuggestCard({
    Key? key,
    required this.imagePath,
  }) : super(key: key);
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SizedBox(
        height: 120.h,
        width: 180.w,
        child: Card(
          color: Colors.white,
          elevation: 2,
          margin: EdgeInsets.only(right: 16.sp),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Color(0xff9A9898),
            ),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
