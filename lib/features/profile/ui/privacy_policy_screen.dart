import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insighta/core/theming/colors.dart';
import 'package:insighta/core/utils/styles.dart';
import 'package:insighta/core/widgets/custom_back_button.dart';
import 'package:insighta/core/widgets/title_and_subtitle_core_profile_item.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomBackButton(),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Privacy Policy',
          style: Styles.textStyle24P,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
              Image.asset(
                'assets/images/privacy_image.png',
                width: 200.w,
                height: 200.h,
                color: ColorsManager.primaryColor,
              ),
              SizedBox(
                height: 12.h,
              ),
              Text(
                'We committed to protecting your privacy.'
                ' Please read this Privacy Policy carefully. '
                'If you do not agree with the terms of this Privacy'
                ' Policy, please do not access the app or use our '
                'services.',
                textAlign: TextAlign.center,
                style: Styles.textStyle14P.copyWith(
                  color: ColorsManager.primaryColor.withValues(alpha: 0.8),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              TitleAndSubtitleCoreProfileItem(
                title: '1. What data does the app collect?',
                subtitle:
                    'The app collects usage patterns, content interaction data, and basic profile information. It does not read private messages or store sensitive personal data.',
              ),
              TitleAndSubtitleCoreProfileItem(
                title: '2. How is my data used?',
                subtitle:
                    'Data is used to generate emotional insights, provide recommendations, and improve the AI model. It’s never sold or shared without your explicit consent.',
              ),
              TitleAndSubtitleCoreProfileItem(
                title: '3. Is my identity protected?',
                subtitle:
                    'Yes. All user data is anonymized before processing. Your identity is safe and secure under strict encryption protocols.',
              ),
              TitleAndSubtitleCoreProfileItem(
                title: '4. Can I delete my data?',
                subtitle:
                    'Yes. Users have full control over their data. You can request data deletion at any time through the settings menu.',
              ),
              TitleAndSubtitleCoreProfileItem(
                title: '5. Does the app track me across other apps?',
                subtitle:
                    'No. The app only tracks interactions within itself and the data you choose to share from social media platforms via integration.',
              ),
              SizedBox(
                height: 40.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
