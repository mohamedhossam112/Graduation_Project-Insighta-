import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insighta/core/routing/routes.dart';

import 'package:insighta/core/utils/styles.dart';
import 'package:insighta/core/widgets/custom_back_button.dart';
import 'package:insighta/features/profile/ui/widgets/custom_about_raw.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  Future<String> _getAppVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomBackButton(),
        centerTitle: true,
        title: Text(
          'About',
          style: Styles.textStyle20P,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              CustomAboutRow(
                title: 'About your account',
                onTap: () {
                  Navigator.pushNamed(context, Routes.aboutYourAccountScreen);
                },
              ),
              Divider(
                thickness: 0.6,
              ),
              FutureBuilder<String>(
                future: _getAppVersion(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CustomAboutRow(
                      title: 'Version',
                      value: 'Loading...',
                      hasArrow: false,
                    );
                  } else if (snapshot.hasError) {
                    return CustomAboutRow(
                      title: 'Version',
                      value: 'Error',
                      hasArrow: false,
                    );
                  } else {
                    return CustomAboutRow(
                      title: 'Version',
                      value: snapshot.data ?? 'Unknown',
                      hasArrow: false,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
