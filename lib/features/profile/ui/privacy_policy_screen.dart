import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
                'assets/images/help_image.png',
                width: 200.w,
                height: 200.h,
                color: ColorsManager.primaryColor,
              ),
              SizedBox(
                height: 12.h,
              ),
              Text(
                'Welcome to the Help Center! Here, you will find '
                'answers to common questions, guides on '
                'using our services, If you need further assistance, '
                'please contact our support team.',
                textAlign: TextAlign.center,
                style: Styles.textStyle14P.copyWith(
                  color: ColorsManager.primaryColor.withValues(alpha: 0.8),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              TitleAndSubtitleCoreProfileItem(
                title: '1. How does Solidify help with concrete mix design?',
                subtitle:
                    'Solidify uses AI-driven algorithms to suggest optimized concrete mix designs based on project requirements, material properties, and environmental conditions. Users can adjust parameters to fine-tune their mix.',
              ),
              TitleAndSubtitleCoreProfileItem(
                title: '2. Can I save and share my project data?',
                subtitle:
                    'Yes! Solidify allows you to save your project details and share them with team members or clients. You can export reports or share data directly through the app.',
              ),
              TitleAndSubtitleCoreProfileItem(
                title: '3. Is my data secure in the app?',
                subtitle:
                    'Absolutely. We use encryption and secure storage methods to protect your information. You also have control over your data and can modify or delete it anytime.',
              ),
              TitleAndSubtitleCoreProfileItem(
                title: '4. How accurate are the AI recommendations?',
                subtitle:
                    'Our AI is trained on industry standards and best practices, providing highly reliable suggestions. However, we always recommend that engineers validate AI-generated results before implementation.',
              ),
              TitleAndSubtitleCoreProfileItem(
                title: '5. What should I do if I encounter a technical issue?',
                subtitle:
                    'If you face any issues, try restarting the app or checking for updates. If the problem persists, contact our support team through the app’s support section.',
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
