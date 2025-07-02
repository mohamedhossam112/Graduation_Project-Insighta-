// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:insighta/core/theming/colors.dart';
import 'package:insighta/core/utils/styles.dart';
import 'package:insighta/features/therapy/data/models/therapy_response.dart';

class TherapyCard extends StatelessWidget {
  const TherapyCard({
    Key? key,
    required this.therapyModel,
  }) : super(key: key);
  final Payload therapyModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/selectTimeSlotsScreen');
      },
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: ColorsManager.primaryColor, width: 2.w),
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 2,
        color: Colors.white,
        margin: EdgeInsets.all(8.sp),
        child: Column(
          children: [
            ListTile(
              leading: Padding(
                padding: EdgeInsets.only(top: 8.h),
                child: Image.network(
                  therapyModel.therapyFile?.url ?? '',
                  width: 36.w,
                ),
              ),
              title: Text(
                therapyModel.name ?? '',
                style: Styles.textStyle20P,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
              child: Row(
                children: [
                  Icon(
                    FontAwesomeIcons.envelope,
                    color: ColorsManager.primaryColor,
                    size: 20.sp,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    therapyModel.email ?? '',
                    style: Styles.textStyle14P,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
              child: Row(
                children: [
                  Icon(
                    FontAwesomeIcons.phone,
                    color: ColorsManager.primaryColor,
                    size: 18.sp,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    therapyModel.phone ?? '',
                    style: Styles.textStyle14P,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
              child: Row(
                children: [
                  Icon(
                    FontAwesomeIcons.userDoctor,
                    color: ColorsManager.primaryColor,
                    size: 18.sp,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    therapyModel.specialty ?? '',
                    style: Styles.textStyle14P,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
              child: Row(
                children: [
                  Icon(
                    FontAwesomeIcons.star,
                    color: ColorsManager.primaryColor,
                    size: 18.sp,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    therapyModel.rating ?? '',
                    style: Styles.textStyle14P,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                right: 18.w,
                left: 18.w,
                top: 12.h,
              ),
              child: Row(
                children: [
                  Icon(
                    FontAwesomeIcons.dollarSign,
                    color: ColorsManager.primaryColor,
                    size: 18.sp,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    therapyModel.price ?? '',
                    style: Styles.textStyle14P,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
          ],
        ),
      ),
    );
  }
}
