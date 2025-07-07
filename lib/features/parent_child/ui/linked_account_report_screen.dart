import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:insighta/core/theming/colors.dart';
import 'package:insighta/core/utils/styles.dart';
import 'package:insighta/core/widgets/custom_back_button.dart';
import 'package:insighta/features/parent_child/data/models/linked_account_model.dart';

class LinkedAccountReportScreen extends StatelessWidget {
  final LinkedAccountModel account;

  const LinkedAccountReportScreen({super.key, required this.account});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  // =============================
  // AppBar Section
  // =============================
  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 0,
      title: Text(
        'Linked Account Report',
        style: Styles.textStyle24P,
      ),
      leading: CustomBackButton(),
    );
  }

  // =============================
  // Body Section
  // =============================
  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Column(
        children: [
          _buildOverviewBox(),
          SizedBox(height: 24.h),
          _buildPlatformCard(
            platform: 'Facebook',
            logoPath: 'assets/svgs/facebook_logo.svg',
            platformColor: ColorsManager.facebookColor,
            message:
                'Please remember to wear a headscarf when visiting the mosque as a sign of respect for Islamic traditions and the sacredness of the place. Wearing a headscarf reflects modesty and reverence in religious spaces and is part of the etiquette for entering mosques.',
          ),
          SizedBox(height: 16.h),
          _buildPlatformCard(
            platform: 'Instagram',
            logoPath: 'assets/svgs/instagram_logo.svg',
            platformColor: ColorsManager.instagramColor,
            message:
                'Avoid sharing personal information publicly and use strong passwords to secure your Instagram account.',
          ),
          SizedBox(height: 16.h),
          _buildPlatformCard(
            platform: 'Twitter',
            logoPath: 'assets/svgs/twitter_logo.svg',
            platformColor: ColorsManager.twitterColor,
            message:
                'Be mindful of the content you share. Spreading misinformation can harm others and reduce your credibility.',
          ),
        ],
      ),
    );
  }

  // =============================
  // Overview Box (Top Banner)
  // =============================
  Widget _buildOverviewBox() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: const Color(0xFF076372),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Text(
        'Overview: Based on recent activity, we suggest following best practices for safe and respectful social media usage.',
        style: Styles.textStyle14I
            .copyWith(fontWeight: FontWeight.w500, color: Colors.white),
        textAlign: TextAlign.center,
      ),
    );
  }

  // =============================
  // Platform Card (Reusable)
  // =============================
  Widget _buildPlatformCard({
    required String platform,
    required String logoPath,
    required Color platformColor,
    required String message,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPlatformHeader(platform, logoPath, platformColor),
            SizedBox(height: 16.h),
            Image.asset(
              'assets/images/card_image.png',
              width: 240.w,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 16.h),
            Text(
              '"$message"',
              style: Styles.textStyle14I
                  .copyWith(color: Colors.black, fontSize: 13.sp),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }

  // =============================
  // Header for Each Platform
  // =============================
  Widget _buildPlatformHeader(String platform, String assetPath, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(assetPath, width: 24.w, height: 24.h),
        SizedBox(width: 8.w),
        Text(
          platform,
          style: Styles.textStyle18I
              .copyWith(fontWeight: FontWeight.w700, color: color),
        ),
      ],
    );
  }
}
