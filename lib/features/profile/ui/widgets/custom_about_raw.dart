import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:insighta/core/theming/colors.dart';
import 'package:insighta/core/utils/styles.dart';

class CustomAboutRow extends StatelessWidget {
  final String title;
  final String? value;
  final bool hasArrow;
  final VoidCallback? onTap;

  const CustomAboutRow({
    super.key,
    required this.title,
    this.value,
    this.hasArrow = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          SizedBox(
            height: 8.h,
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              title,
              style: Styles.textStyle14P,
            ),
            trailing: hasArrow
                ? Icon(
                    FontAwesomeIcons.arrowRight,
                    color: ColorsManager.primaryColor,
                  )
                : value != null
                    ? Text(
                        value!,
                        style: Styles.textStyle14P,
                      )
                    : null,
          ),
        ],
      ),
    );
  }
}
