import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:insighta/core/theming/colors.dart';
import 'package:insighta/core/utils/styles.dart';
import 'package:insighta/core/widgets/custom_back_button.dart';
import 'package:insighta/features/profile/ui/widgets/delete_account_bloc_listener.dart';
import 'package:insighta/features/profile/ui/widgets/delete_account_form.dart';

class DeleteAccountScreen extends StatelessWidget {
  const DeleteAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomBackButton(),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                FontAwesomeIcons.triangleExclamation,
                color: ColorsManager.primaryColor,
                size: 36.sp,
              ),
              SizedBox(
                height: 12.h,
              ),
              Text(
                'Delete Account',
                style: Styles.textStyle20P,
              ),
              SizedBox(
                height: 12.h,
              ),
              Text(
                'Once you delet your account, there is no going back. Please be certain',
                style: Styles.textStyle14P,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 36.h,
              ),
              DeleteAccountForm(),
              DeleteAccountBlocListener(),
            ],
          ),
        ),
      ),
    );
  }
}
