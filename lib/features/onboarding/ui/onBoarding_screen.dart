import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:insighta/core/theming/colors.dart';
import 'package:insighta/core/utils/styles.dart';

import 'package:insighta/features/onboarding/data/model/onboarding_model.dart';
import 'package:insighta/features/onboarding/ui/widgets/circled_arrow_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class onBoardingScreen extends StatefulWidget {
  const onBoardingScreen({super.key});

  @override
  State<onBoardingScreen> createState() => _onBoardingScreenState();
}

class _onBoardingScreenState extends State<onBoardingScreen> {
  final PageController _controller = PageController();
  bool onLastPage = false;

  final onboardingList = getOnBoardingList();

  void finishOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasSeenOnboarding', true);
    Navigator.pushReplacementNamed(context, '/logInScreen');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: _controller,
              itemCount: onboardingList.length,
              onPageChanged: (index) {
                setState(() {
                  onLastPage = index == onboardingList.length - 1;
                });
              },
              itemBuilder: (context, index) {
                final model = onboardingList[index];
                return Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 18.w, vertical: 16.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        model.imagePath,
                        height: 300.h,
                      ),
                      SizedBox(height: 30.h),
                      Text(
                        model.body,
                        style: Styles.textStyle20P.copyWith(
                            color: Colors.black, fontWeight: FontWeight.w400),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),
            Positioned(
              bottom: 60.h,
              left: 24.w,
              right: 24.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircledArrowButton(
                    onPressed: () {
                      if (_controller.page! > 0) {
                        _controller.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease,
                        );
                      }
                    },
                    icon: FontAwesomeIcons.arrowLeft,
                    color: Color(0xffDADADA),
                    iconColor: Color(0xff263238),
                  ),
                  SmoothPageIndicator(
                    controller: _controller,
                    count: onboardingList.length,
                    effect: WormEffect(
                      dotHeight: 10.h,
                      dotWidth: 60.w,
                      activeDotColor: ColorsManager.primaryColor,
                    ),
                  ),
                  CircledArrowButton(
                      onPressed: () {
                        if (onLastPage) {
                          finishOnboarding();
                        } else {
                          _controller.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.ease,
                          );
                        }
                      },
                      icon: FontAwesomeIcons.arrowRight,
                      color: ColorsManager.primaryColor,
                      iconColor: Colors.white)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
