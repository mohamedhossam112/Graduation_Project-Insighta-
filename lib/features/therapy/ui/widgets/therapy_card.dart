import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:insighta/core/theming/colors.dart';
import 'package:insighta/core/utils/styles.dart';
import 'package:insighta/features/therapy/ui/widgets/second_half_of_therapy_card.dart';

class TherapyCard extends StatelessWidget {
  const TherapyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/bookingScreen');
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
              leading: Image.asset('assets/images/doc.png'),
              title: Text(
                'Dr Mohamed Breset ',
                style: Styles.textStyle20P,
              ),
              subtitle: Text('Gynecologue obstericien'),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
              child: Row(
                children: [
                  Icon(
                    FontAwesomeIcons.locationDot,
                    color: ColorsManager.primaryColor,
                    size: 20.sp,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    '4 Rue du Doctour Roux 75015 Paric',
                    style: Styles.textStyle14P,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 18.w,
              ),
              child: Row(
                children: [
                  Icon(
                    FontAwesomeIcons.check,
                    color: ColorsManager.primaryColor,
                    size: 20.sp,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    'Conventionne secture 2',
                    style: Styles.textStyle14P,
                  ),
                ],
              ),
            ),
            Divider(
              color: ColorsManager.primaryColor,
            ),
            SecondHalfofTherapyCard(),
            SizedBox(
              height: 40.h,
            ),
          ],
        ),
      ),
    );
  }
}
