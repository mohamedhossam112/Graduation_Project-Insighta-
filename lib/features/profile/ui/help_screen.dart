import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insighta/core/theming/colors.dart';

import 'package:insighta/core/utils/styles.dart';
import 'package:insighta/core/widgets/custom_back_button.dart';
import 'package:insighta/core/widgets/title_and_subtitle_core_profile_item.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomBackButton(),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Help',
          style: Styles.textStyle20P,
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
                title: '1. How does this app help improve my mental health?',
                subtitle:
                    'The app uses AI to track your social media interactions and identify negative patterns affecting your mood. It offers insights and recommendations to support emotional well-being.',
              ),
              TitleAndSubtitleCoreProfileItem(
                title: '2. What kind of content does the app analyze?',
                subtitle:
                    'It analyzes the text, images, and videos you engage with across social platforms. The system detects sentiment, emotional triggers, and keywords that may impact your mental health.',
              ),
              TitleAndSubtitleCoreProfileItem(
                title: '3. Can the app help reduce my screen time?',
                subtitle:
                    'Yes. The app provides detailed reports on your daily social media usage and gives personalized suggestions to help you minimize unhealthy screen time.',
              ),
              TitleAndSubtitleCoreProfileItem(
                title: '4. Will I receive recommendations?',
                subtitle:
                    'Absolutely. The app offers AI-based content recommendations like uplifting videos, mindfulness exercises, and healthier digital habits tailored to your behavior.',
              ),
              TitleAndSubtitleCoreProfileItem(
                title: '5. How does the app detect emotional changes?',
                subtitle:
                    'Using sentiment analysis, the app monitors how the content you consume correlates with emotional signals like stress, anxiety, or sadness, then visualizes the trends.',
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
