import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insighta/core/theming/colors.dart';

class ChangePhotoWidget extends StatefulWidget {
  const ChangePhotoWidget({super.key});

  @override
  State<ChangePhotoWidget> createState() => _ChangePhotoWidgetState();
}

class _ChangePhotoWidgetState extends State<ChangePhotoWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Stack(
        children: [
          Center(
            child: CircleAvatar(
              radius: 50.r,
              backgroundImage: AssetImage('assets/images/profile_image.png'),
            ),
          ),
          Positioned(
              bottom: -10,
              right: 130,
              child: IconButton(
                onPressed: () {},
                icon: Container(
                  decoration: BoxDecoration(
                    color: ColorsManager.primaryColor,
                    shape: BoxShape.circle,
                  ),
                  padding: EdgeInsets.all(6),
                  child: Icon(
                    Icons.add_a_photo,
                    color: Colors.white,
                    size: 14.sp,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
