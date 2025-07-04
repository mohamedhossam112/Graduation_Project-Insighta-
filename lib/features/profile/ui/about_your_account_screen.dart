import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:insighta/core/helpers/shared_pref_helper.dart';
import 'package:insighta/core/theming/colors.dart';
import 'package:insighta/core/utils/styles.dart';
import 'package:insighta/core/widgets/custom_back_button.dart';
import 'package:intl/intl.dart';

class AboutYourAccountScreen extends StatelessWidget {
  const AboutYourAccountScreen({super.key});

  Future<String> _getFormattedDate() async {
    final String dateString = await SharedPrefHelper.getString(
      SharedPrefKeys.joinedDate,
    );
    if (dateString.isEmpty) return 'N/A';

    final DateTime date = DateTime.parse(dateString);
    return DateFormat('MMM y').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomBackButton(),
        centerTitle: true,
        title: Text(
          'About your account',
          style: Styles.textStyle20P,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: FutureBuilder<String>(
          future: _getFormattedDate(),
          builder: (context, snapshot) {
            final String date = snapshot.data ?? 'N/A';
            return Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(
                    FontAwesomeIcons.calendarDays,
                    color: ColorsManager.primaryColor,
                  ),
                  title: Text(
                    'Joined date',
                    style: Styles.textStyle14P.copyWith(fontSize: 16.sp),
                  ),
                  trailing: Text(
                    date,
                    style: Styles.textStyle14P.copyWith(fontSize: 12.sp),
                  ),
                ),
                Divider(
                  thickness: 0.6,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
