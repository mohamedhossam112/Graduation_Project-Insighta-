// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:insighta/core/utils/styles.dart';

class ReportCardDetailsScreen extends StatelessWidget {
  final Map<String, dynamic>? arguments;
  const ReportCardDetailsScreen({
    Key? key,
    this.arguments,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (arguments == null) {
      return const Scaffold(
        body: Center(child: Text('No data received for this card.')),
      );
    }

    final String platform = arguments!['platform'];
    final String assetPath = arguments!['assetPath'];

    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        Card(
          margin: EdgeInsets.symmetric(
            vertical: 18.h,
            horizontal: 22.w,
          ),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Color(0xffC8C3C3)),
            borderRadius: BorderRadius.circular(12.r),
          ),
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(18.r),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      assetPath,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      platform,
                      style: Styles.textStyle20,
                    ),
                  ],
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  '"Please remember to wear a headscarf when visiting the mosque as a sign of respect for Islamic traditions and the sacredness of the place. Wearing a headscarf reflects modesty and reverence in religious spaces and is part of the etiquette for entering mosques.""Please remember to wear a headscarf when visiting the mosque as a sign of respect for Islamic traditions and the sacredness of the place. Wearing a headscarf reflects modesty and reverence in religious spaces and is part of the etiquette for entering mosques.""Please remember to wear a headscarf when visiting the mosque as a sign of respect for Islamic traditions and the sacredness of the place. Wearing a headscarf reflects modesty and reverence in religious spaces and is part of the etiquette for entering mosques.""Please remember to wear a headscarf when visiting the mosque as a sign of respect for Islamic traditions and the sacredness of the place. Wearing a headscarf reflects modesty and reverence in religious spaces and is part of the etiquette for entering mosques."',
                  style: Styles.textStyle12,
                ),
              ],
            ),
          ),
        ),
        Image.asset('assets/images/card_image.png', width: 240.w, height: 200.h)
      ],
    )));
  }
}
