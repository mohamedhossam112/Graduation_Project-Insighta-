// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({
    Key? key,
    required this.image,
  }) : super(key: key);
  final String image;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      width: 200.w,
      child: Card(
        color: Colors.white,
        elevation: 2,
        margin: EdgeInsets.only(right: 16.sp),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Color(0xff9A9898),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
            imageUrl: image,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
