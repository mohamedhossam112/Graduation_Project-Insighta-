import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insighta/core/helpers/shared_pref_helper.dart';
import 'package:insighta/core/routing/routes.dart';

import 'package:insighta/core/utils/styles.dart';

import 'package:insighta/features/profile/ui/widgets/logout_dialog.dart';
import 'package:insighta/features/profile/ui/widgets/profile_screen_item.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  Future<String> getProfileUrl() async {
    String? profileUrl = await SharedPrefHelper.getString(
            SharedPrefKeys.profileImageUrl) ??
        'https://cdn.pixabay.com/photo/2017/06/13/12/54/profile-2398783_1280.png';
    return profileUrl;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Profile',
          style: Styles.textStyle20P,
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.h),
        child: Column(
          children: [
            SizedBox(height: 24.h),
            Center(
              child: FutureBuilder(
                  future: getProfileUrl(),
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.hasData) {
                      String? url = snapshot.data;
                      return CircleAvatar(
                        radius: 50.r,
                        backgroundImage: url != null
                            ? CachedNetworkImageProvider(url)
                            : AssetImage('assets/images/profile_image.png')
                                as ImageProvider,
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  }),
            ),
            SizedBox(height: 16.h),
            Center(
              child: Text(
                'Noha Elmahdy',
                style: Styles.textStyle20P,
              ),
            ),
            SizedBox(height: 30.h),
            ProfileScreenItem(
              icon: Icons.person,
              title: 'Edit Profile',
              titleStyle: Styles.textStyle16I
                  .copyWith(fontWeight: FontWeight.w700, color: Colors.black),
              onTap: () {
                Navigator.pushNamed(context, Routes.editProfileScreen);
              },
            ),
            SizedBox(height: 16.h),
            ProfileScreenItem(
              icon: Icons.settings,
              title: 'Settings',
              titleStyle: Styles.textStyle16I
                  .copyWith(fontWeight: FontWeight.w700, color: Colors.black),
              onTap: () {
                Navigator.pushNamed(context, Routes.settingsScreen);
              },
            ),
            SizedBox(height: 16.h),
            ProfileScreenItem(
              icon: Icons.logout,
              title: 'Log Out',
              titleStyle: Styles.textStyle16I
                  .copyWith(fontWeight: FontWeight.w700, color: Colors.red),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => LogoutDialog(),
                );
              },
            ),
          ],
        ),
      )),
    );
  }
}
